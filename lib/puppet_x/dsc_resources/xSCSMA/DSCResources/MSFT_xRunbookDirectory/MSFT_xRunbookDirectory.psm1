data LocalizedData 
{ 
    # culture="en-US" 
    ConvertFrom-StringData -StringData @' 
 FindingRunbookDefinition = Finding runbook definition for {0}. 
 ExistinRunbookDefinition = Existing Runbook definition found.
 CreatingTempFile = Creating temp file at {0}.
 RunbookFoundMatches = Runbook found matches. No import needed.
 RunbookDifferencesFound = Runbook differences found. Import needed.
 RemovingTempFile = Removing temp file at {0}.
 ImportTwice = Importing all runbooks twice to build all dependencies.
 ImportingRunbook = Importing Runbook {0}.
 ImportNotRequired = An import is not required.
 ImportRequired = An import is required.
 ImportCount = Import number {0}.
 RemovingRunbook = Removing runbook {0}.
 FailedToRemoveRunbook = Failed to remove Runbook {0}.
'@ 
} 

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Published", "Draft", "Absent")]
        [System.String]
        $Ensure = "Published",

        [parameter(Mandatory = $true)]
        [System.String]
        $RunbookPath,

        [parameter(Mandatory = $true)]
        [System.String]
        $WebServiceEndpoint,

        [Uint32]
        $Port = 9090
    )

    $RunbookPathItems = Get-Item $RunbookPath -Filter *.ps1

    $ensureStatus = "Absent"
    $match = $true
    forEach ($RunbookPathItem in $RunbookPathItems)
    {
        if( $match )
        {
            Write-Verbose ( $($LocalizedData.FindingRunbookDefinition) -f $RunbookPathItem.BaseName )

            # Get runbook definition if one exist
            $runbookFound = $false
            try
            {
                if( $Ensure -eq "Published" )
                {
                    $runbookDefinition = Get-SmaRunbookDefinition -Name $($RunbookPathItem.BaseName) -WebServiceEndpoint $WebServiceEndpoint -Port $port -Type 'Published' -ErrorAction Stop

                    $ensureStatus = "Published"
                }
                else
                {
                    $runbookDefinition = Get-SmaRunbookDefinition -Name $($RunbookPathItem.BaseName) -WebServiceEndpoint $WebServiceEndpoint -Port $port -Type 'Draft' -ErrorAction Stop

                    $ensureStatus = "Draft"
                }

                $runbookFound = $true
                Write-Verbose ( $LocalizedData.ExistinRunbookDefinition )
            }
            catch
            {
                Write-Verbose $_ 
                $match = $false
            }

            if( $runbookFound )
            {
                # Can't compare the value of the $runbookDefinition.Content variable to a file, so writing it to a file, then will compare that.
                $runbookTempPath = "$env:TEMP\$($RunbookPathItem.BaseName).ps1"

                Write-Verbose ( $($LocalizedData.CreatingTempFile) -f $runbookTempPath)
                $runbookDefinition.Content.ToString() | Out-File -FilePath $runbookTempPath

                $compare = Compare-Object -ReferenceObject (Get-Content $RunbookPathItem.FullName) -DifferenceObject (Get-Content $runbookTempPath)
                if( $compare -eq $null )
                {
                    Write-Verbose ( $LocalizedData.RunbookFoundMatches )
                }
                Else
                {
                    # Compare-Object sometimes returns new lines as a difference, this can cause repeated re-imports if that new line is at the top of the ps1
                    # since SMA will strip this out on import.

                    foreach( $difference in $compare )
                    {
                        if( $difference.InputObject -ne "" )
                        {
                            Write-Verbose ( $LocalizedData.RunbookDifferencesFound )
                            $match = $false
                        }
                    }

                    if( $match )
                    {
                        Write-Verbose ( $LocalizedData.RunbookFoundMatches )
                    }
                }

                Write-Verbose ( $($LocalizedData.RemovingTempFile) -f $runbookTempPath )
                Remove-Item -Path $runbookTempPath
            }
        }
    }

    $returnValue = @{
        Ensure = [System.String]$ensureStatus
        RunbookPath = [System.String]$RunbookPath
        WebServiceEndpoint = [System.String]$WebServiceEndpoint
        Port = [System.String]$Port
        Matches = [System.Boolean]$match
    }

    $returnValue
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Published", "Draft", "Absent")]
        [System.String]
        $Ensure = "Published",

        [parameter(Mandatory = $true)]
        [System.String]
        $RunbookPath,

        [parameter(Mandatory = $true)]
        [System.String]
        $WebServiceEndpoint,

        [Uint32]
        $Port = 9090
    )

    $RunbookPathItems = Get-Item $RunbookPath -Filter *.ps1

    if( $Ensure -eq "Absent")
    {
        forEach ($RunbookPathItem in $RunbookPathItems)
        {
            try
            {
                Write-Verbose ( $($LocalizedData.RemovingRunbook) -f $RunbookPathItem.BaseName)

                Remove-SmaRunbook -Name $RunbookPathItem.BaseName -WebServiceEndpoint $WebServiceEndpoint -Port $port -ErrorAction Stop
            }
            catch
            {
                Write-Verbose ( $($LocalizedData.FailedToRemoveRunbook) -f $RunbookPathItem.BaseName)
            }
        }
    }
    else
    {
        Write-Verbose ( $LocalizedData.ImportTwice )
        for($k = 1; $k -lt 3; $k++)
        {
            Write-Verbose ( $($LocalizedData.ImportCount) -f $k )
            forEach ($RunbookPathItem in $RunbookPathItems)
            {
                # try to edit an existing runbook with the same name, this saves a read to verify that the runbook exist.
                # if error, assume the runbook has never been imported
                Write-Verbose ( $($LocalizedData.ImportingRunbook) -f $RunbookPathItem.BaseName )
                try
                {
                    Edit-SmaRunbook -Path $RunbookPathItem.FullName -Name $RunbookPathItem.BaseName -WebServiceEndpoint $WebServiceEndpoint -Port $port -Overwrite -ErrorAction Stop
                }
                catch
                {
                    Import-SmaRunbook -Path $RunbookPathItem.FullName -WebServiceEndpoint $WebServiceEndpoint -Port $port -ErrorAction Stop
                }      
            }
        }

        if( $Ensure -eq "Published" )
        {
            forEach ($RunbookPathItem in $RunbookPathItems)
            {
                Publish-SmaRunbook -Name $RunbookPathItem.BaseName -WebServiceEndpoint $WebServiceEndpoint -Port $port -ErrorAction Stop
            }
        }
    }
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Published", "Draft", "Absent")]
        [System.String]
        $Ensure = "Published",

        [parameter(Mandatory = $true)]
        [System.String]
        $RunbookPath,

        [parameter(Mandatory = $true)]
        [System.String]
        $WebServiceEndpoint,

        [Uint32]
        $Port = 9090
    )

    $results = Get-TargetResource @PSBoundParameters

    if( ($Ensure -eq "Published") -or ($Ensure -eq "Draft") )
    {
        if( ($results.Ensure -eq $Ensure) -and ($results.Matches -eq $true) )
        {
            Write-Verbose ( $LocalizedData.ImportNotRequired )
            return $true
        }
    }

    if( ($results.Ensure -eq "Absent") -and ($Ensure -eq "Absent") )
    {
        Write-Verbose ( $LocalizedData.ImportNotRequired )
        return $true
    }

    Write-Verbose ( $LocalizedData.ImportRequired )
    return $false
}


Export-ModuleMember -Function Get-TargetResource, Set-TargetResource, Test-TargetResource


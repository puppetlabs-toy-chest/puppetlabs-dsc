function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [System.String]
        $Version,

        [System.String]
        $MinVersion,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SCOMAdminCredential,

        [System.String]
        $SourcePath,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourceFolder,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourceFile
    )

    $Version = Invoke-Command -ComputerName . -Credential $SCOMAdminCredential {
        $Name = $args[0]
        Import-Module OperationsManager
        [String](Get-SCManagementPack -Name $Name).Version
    } -ArgumentList @($Name)

    $returnValue = @{
        Name = $Name
        Version = $Version
    }

    $returnValue
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [System.String]
        $Version,

        [System.String]
        $MinVersion,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SCOMAdminCredential,

        [System.String]
        $SourcePath,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourceFolder,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourceFile
    )

    if([String]::IsNullOrEmpty($SourcePath))
    {
        $SourcePath = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\System Center Operations Manager\12\Setup" -Name "InstallDirectory").InstallDirectory
    }
    $MPFile = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath $SourceFile

    if(Test-Path -Path $MPFile)
    {
        Write-Verbose "MPFile: $MPFile"
        Invoke-Command -ComputerName . -Credential $SCOMAdminCredential -Authentication Credssp {
            $MPFile = $args[0]
            Import-Module OperationsManager
            Import-SCManagementPack $MPFile
        } -ArgumentList @($MPFile)
    }

    if(!(Test-TargetResource @PSBoundParameters))
    {
        throw "Set-TargetResouce failed"
    }
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [System.String]
        $Version,

        [System.String]
        $MinVersion,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SCOMAdminCredential,

        [System.String]
        $SourcePath,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourceFolder,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourceFile
    )

    $result = $true
    
    $MPData = Get-TargetResource @PSBoundParameters

    # Test for MP not installed
    if([String]::IsNullOrEmpty($MPData.Version))
    {
        $result = $false
    }

    if($result)
    {
        # Test just for MP, no version
        if([String]::IsNullOrEmpty($Version) -and [String]::IsNullOrEmpty($MinVersion))
        {
            if(![String]::IsNullOrEmpty($MPData.Version))
            {
                $result = $true
            }
            else
            {
                $result = $false
            }
        }
    
        # Test for MP specific version
        if(![String]::IsNullOrEmpty($Version))
        {
            if($Version -eq $MPData.Version)
            {
                $result = $true
            }
            else
            {
                $result = $false
            }
        }
        # Test for MP minimum version
        else
        {
            $MinVersionArray = $MinVersion.Split(".")
            $VersionArray = $MPData.Version.Split(".")

            if($VersionArray[0] -lt $MinVersionArray[0])
            {
                $result = $false
            }
            else
            {
                if($VersionArray[0] -gt $MinVersionArray[0])
                {
                    $result = $true
                }
                else
                {
                    if($VersionArray[1] -lt $MinVersionArray[1])
                    {
                        $result = $false
                    }
                    else
                    {
                        if($VersionArray[1] -gt $MinVersionArray[1])
                        {
                            $result = $true
                        }
                        else
                        {
                            if($VersionArray[2] -lt $MinVersionArray[2])
                            {
                                $result = $false
                            }
                            else
                            {
                                if($VersionArray[2] -gt $MinVersionArray[2])
                                {
                                    $result = $true
                                }
                                else
                                {
                                    if($VersionArray[3] -lt $MinVersionArray[3])
                                    {
                                        $result = $false
                                    }
                                    else
                                    {
                                        if($VersionArray[3] -ge $MinVersionArray[3])
                                        {
                                            $result = $true
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    $result
}


Export-ModuleMember -Function *-TargetResource

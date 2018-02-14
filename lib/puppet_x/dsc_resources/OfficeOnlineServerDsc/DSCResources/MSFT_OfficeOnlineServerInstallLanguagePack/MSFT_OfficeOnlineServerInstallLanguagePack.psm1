$Script:UninstallPath = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
$script:InstallKeyPattern = "Office1(5)|(6).WacServerLpk."

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)] 
        [ValidateSet("Present","Absent")] 
        [System.String] 
        $Ensure,

        [Parameter(Mandatory = $true)]  
        [System.String] 
        $BinaryDir,

        [Parameter(Mandatory = $true)]  
        [System.String] 
        $Language 
    )

    Write-Verbose -Message "Getting install status of the $Language Language Pack"

    if ($Ensure -eq "Absent") 
    {
        throw "Uninstallation of Language Packs is not currently supported by OfficeOnlineServer Dsc"
    }
    
    Write-Verbose -Message "Update is for the $Language language"

    $matchPath = "HKEY_LOCAL_MACHINE\\$($Script:UninstallPath.Replace('\','\\'))" + `
        "\\$script:InstallKeyPattern" + $Language
    $wacPath = Get-ChildItem -Path "HKLM:\$Script:UninstallPath" | Where-Object -FilterScript {
        $_.Name -match $matchPath
    }

    if ($null -ne $wacPath)
    {
        Write-Verbose -Message "Language Pack $Language is found"
        return @{
            BinaryDir         = $BinaryDir
            Language          = $Language
            Ensure            = "Present"
        }
    }
    else
    {
        Write-Verbose -Message "Language Pack $Language is NOT found"
        return @{
            BinaryDir         = $BinaryDir
            Language          = $Language
            Ensure            = "Absent"
        }
    }
}


function Set-TargetResource
{
    # Supressing the global variable use to allow passing DSC the reboot message
    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidGlobalVars", "")]
    param
    (
        [Parameter(Mandatory = $true)] 
        [ValidateSet("Present","Absent")] 
        [System.String] 
        $Ensure,

        [Parameter(Mandatory = $true)]  
        [System.String] 
        $BinaryDir,

        [Parameter(Mandatory = $true)]  
        [System.String] 
        $Language
    )

    Write-Verbose -Message "Setting install status of Office Online Language Pack"

    if ($Ensure -eq "Absent") 
    {
        throw [Exception] ("OfficeOnlineServerDsc does not support uninstalling " + `
                           "Language Packs. Please remove this manually.")
        return
    }

    # Check if Binary folder exists
    if (-not(Test-Path -Path $BinaryDir))
    {
        throw "Specified path cannot be found. {$BinaryDir}"
    }
    

    Write-Verbose -Message "Writing install config file"

    Write-Verbose -Message "Beginning installation of the Office Online Server Language Pack"

    $setupExe = Join-Path -Path $BinaryDir -ChildPath "setup.exe"
    
    $installer = Start-Process -FilePath $setupExe `
                               -ArgumentList '/config .\files\setupsilent\config.xml' `
                               -Wait `
                               -PassThru

    switch ($installer.ExitCode) 
    {
        0 {  
            Write-Verbose -Message "Office Online Server Language Pack binary installation complete"
        }
        17022 {
            Write-Verbose -Message "Office Online Server Language Pack binary installation complete. Reboot required."
            $global:DSCMachineStatus = 1
        }
        Default {
            throw "Office Online Server Language Pack install failed, exit code was $($installer.ExitCode)"
        }
    }
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)] 
        [ValidateSet("Present","Absent")] 
        [System.String] 
        $Ensure,

        [Parameter(Mandatory = $true)]  
        [System.String] 
        $BinaryDir,

        [Parameter(Mandatory = $true)]  
        [System.String] 
        $Language
)

    Write-Verbose -Message "Testing install status of Office Online Server $Language Language Pack"


    if ($Ensure -eq "Absent") 
    {
        throw [Exception] ("OfficeOnlineServerDsc does not support uninstalling Office Online Server " + `
                           "Language Packs. Please remove this manually.")
        return
    }

    $CurrentValues = Get-TargetResource @PSBoundParameters

    if($CurrentValues.Ensure -eq $Ensure)
    {
        Write-Verbose -Message "Language Pack $Language is already installed on the server"
        return $true
    }
    else
    {
        return $false
    }
}

Export-ModuleMember -Function *-TargetResource

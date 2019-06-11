function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [System.String]
        $SourceFolder = "\SystemCenter2012R2\Orchestrator",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [System.String]
        [ValidateSet("Yes","No")]
        $SendCEIPReports = "No",

        [System.String]
        [ValidateSet("Yes","No")]
        $UseMicrosoftUpdate = "No",

        [System.String]
        $InstallFolder,

        [parameter(Mandatory = $true)]
        [System.String]
        $DatabaseServer,

        [parameter(Mandatory = $true)]
        [System.String]
        $DatabaseServerInstance,

        [System.String]
        $RepositoryDatabaseName = "UsageRepositoryDB",

        [System.String]
        $StagingDatabaseName = "UsageStagingDB",

        [System.String]
        $DWDatabaseName = "UsageWarehouseDB",

        [parameter(Mandatory = $true)]
        [System.String]
        $AnalysisDatabaseServer,

        [parameter(Mandatory = $true)]
        [System.String]
        $AnalysisDatabaseServerInstance,

        [System.String]
        $AnalysisDatabaseName = "UsageAnalysisDB"
    )

    Import-Module $PSScriptRoot\..\..\xPDT.psm1
        
    $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "\Service Reporting\setup.exe"
    $Path = ResolvePath $Path
    $Version = (Get-Item -Path $Path).VersionInfo.ProductVersion

    switch($Version)
    {
        "7.2.462.0"
        {
            $IdentifyingNumber = "{643E2225-E1BB-4586-9CBE-8BC2DED6D12E}"
            $SCVersion = "System Center 2012 R2"
        }
        "7.2.3002.0"
        {
            $IdentifyingNumber = "{643E2225-E1BB-4586-9CBE-8BC2DED6D12E}"
            $SCVersion = "System Center Technical Preview"
        }
        Default
        {
            throw "Unknown version of Service Reporting!"
        }
    }

    if(Get-WmiObject -Class Win32_Product | Where-Object {$_.IdentifyingNumber -eq $IdentifyingNumber})
    {
        switch($SCVersion)
        {
            "System Center 2012 R2"
            {
                $Reg = "HKLM:\SOFTWARE\Microsoft\System Center Service Reporting\R2"
            }
            "System Center Technical Preview"
            {
                $Reg = "HKLM:\SOFTWARE\Microsoft\System Center Service Reporting\R2"
            }
        }
        $InstallFolder = (Get-ItemProperty -Path $Reg -Name "PackageFolder").PackageFolder
        $DatabaseServer = (Get-ItemProperty -Path $Reg -Name "DWRepositoryDBHost").DWRepositoryDBHost
        if($DatabaseServer.Contains("\"))
        {
            $DatabaseServerInstance = $DatabaseServer.Split("\")[1]
            $DatabaseServer = $DatabaseServer.Split("\")[0]
        }
        else
        {
            $DatabaseServerInstance = "MSSQLSERVER"
        }
        $RepositoryDatabaseName = (Get-ItemProperty -Path $Reg -Name "ETLRepositoryDBName").ETLRepositoryDBName
        $StagingDatabaseName = (Get-ItemProperty -Path $Reg -Name "StagingDBName").StagingDBName
        $DWDatabaseName = (Get-ItemProperty -Path $Reg -Name "DWRepositoryDBName").DWRepositoryDBName
        $AnalysisDatabaseServer = (Get-ItemProperty -Path $Reg -Name "AnalysisDBHost").AnalysisDBHost
        if($AnalysisDatabaseServer.Contains("\"))
        {
            $AnalysisDatabaseServerInstance = $AnalysisDatabaseServer.Split("\")[1]
            $AnalysisDatabaseServer = $AnalysisDatabaseServer.Split("\")[0]
        }
        else
        {
            $AnalysisDatabaseServerInstance = "MSSQLSERVER"
        }
        $AnalysisDatabaseName = (Get-ItemProperty -Path $Reg -Name "AnalysisDBName").AnalysisDBName
        
        $returnValue = @{
            Ensure = "Present"
            SourcePath = $SourcePath
            SourceFolder = $SourceFolder
            InstallFolder = $InstallFolder
            DatabaseServer = $DatabaseServer
            DatabaseServerInstance = $DatabaseServerInstance
            RepositoryDatabaseName = $RepositoryDatabaseName
            StagingDatabaseName = $StagingDatabaseName
            DWDatabaseName = $DWDatabaseName
            AnalysisDatabaseServer = $AnalysisDatabaseServer
            AnalysisDatabaseServerInstance = $AnalysisDatabaseServerInstance
            AnalysisDatabaseName = $AnalysisDatabaseName
        }
    }
    else
    {
        $returnValue = @{
            Ensure = "Absent"
            SourcePath = $SourcePath
            SourceFolder = $SourceFolder
        }
    }
        
    $returnValue
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [System.String]
        $SourceFolder = "\SystemCenter2012R2\Orchestrator",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [System.String]
        [ValidateSet("Yes","No")]
        $SendCEIPReports = "No",

        [System.String]
        [ValidateSet("Yes","No")]
        $UseMicrosoftUpdate = "No",

        [System.String]
        $InstallFolder,

        [parameter(Mandatory = $true)]
        [System.String]
        $DatabaseServer,

        [parameter(Mandatory = $true)]
        [System.String]
        $DatabaseServerInstance,

        [System.String]
        $RepositoryDatabaseName = "UsageRepositoryDB",

        [System.String]
        $StagingDatabaseName = "UsageStagingDB",

        [System.String]
        $DWDatabaseName = "UsageWarehouseDB",

        [parameter(Mandatory = $true)]
        [System.String]
        $AnalysisDatabaseServer,

        [parameter(Mandatory = $true)]
        [System.String]
        $AnalysisDatabaseServerInstance,

        [System.String]
        $AnalysisDatabaseName = "UsageAnalysisDB"
    )

    Import-Module $PSScriptRoot\..\..\xPDT.psm1
        
    $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "\Service Reporting\setup.exe"
    $Path = ResolvePath $Path
    $Version = (Get-Item -Path $Path).VersionInfo.ProductVersion
    Write-Verbose "Path: $Path"

    switch($Version)
    {
        "7.2.462.0"
        {
            $IdentifyingNumber = "{643E2225-E1BB-4586-9CBE-8BC2DED6D12E}"
        }
        "7.2.3002.0"
        {
            $IdentifyingNumber = "{643E2225-E1BB-4586-9CBE-8BC2DED6D12E}"
        }
        Default
        {
            throw "Unknown version of Service Reporting!"
        }
    }

    switch($Ensure)
    {
        "Present"
        {
            # Create install arguments
            $TempFile = [IO.Path]::GetTempFileName()
            $Arguments = "-Silent $TempFile"
            $AnswerFile = @("-AcceptEULA Yes")
            if($DatabaseServerInstance -eq "MSSQLSERVER")
            {
                $DatabaseServerInstance = $DatabaseServer
            }
            if($AnalysisDatabaseServerInstance -eq "MSSQLSERVER")
            {
                $AnalysisDatabaseServerInstance = $AnalysisDatabaseServer
            }
            $AnswerFileVars = @(
                "SendCEIPReports",
                "UseMicrosoftUpdate",
                "InstallFolder",
                "DatabaseServer",
                "DatabaseServerInstance",
                "RepositoryDatabaseName",
                "StagingDatabaseName",
                "DWDatabaseName",
                "AnalysisDatabaseServer",
                "AnalysisDatabaseServerInstance",
                "AnalysisDatabaseName"
            )
            foreach($AnswerFileVar in $AnswerFileVars)
            {
                if(!([String]::IsNullOrEmpty((Get-Variable -Name $AnswerFileVar).Value)) -and ((Get-Variable -Name $AnswerFileVar).Value -ne 0))
                {
                    if([Environment]::ExpandEnvironmentVariables((Get-Variable -Name $AnswerFileVar).Value).Contains(" "))
                    {
                        $AnswerFile += "-$AnswerFileVar `"" + [Environment]::ExpandEnvironmentVariables((Get-Variable -Name $AnswerFileVar).Value) + "`""
                    }
                    else
                    {
                        $AnswerFile += "-$AnswerFileVar " + [Environment]::ExpandEnvironmentVariables((Get-Variable -Name $AnswerFileVar).Value)
                    }
                }
            }

            Write-Verbose "AnswerFile: $TempFile"
            foreach($Line in $AnswerFile)
            {
                Add-Content -Path $TempFile -Value $Line -Encoding Ascii
                Write-Verbose $Line
            }
        }
        "Absent"
        {
            # Create uninstall arguments
            $Arguments = "-Uninstall"
        }
    }

    Write-Verbose "Arguments: $Arguments"
    
    $Process = StartWin32Process -Path $Path -Arguments $Arguments -Credential $SetupCredential
    Write-Verbose $Process
    WaitForWin32ProcessEnd -Path $Path -Arguments $Arguments -Credential $SetupCredential

    # Clean up
    if(Test-Path -Path $TempFile)
    {
        Remove-Item -Path $TempFile
    }

    if((Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager' -Name 'PendingFileRenameOperations' -ErrorAction SilentlyContinue) -ne $null)
    {
        $global:DSCMachineStatus = 1
    }
    else
    {
        if(!(Test-TargetResource @PSBoundParameters))
        {
            throw "Set-TargetResouce failed"
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
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [System.String]
        $SourceFolder = "\SystemCenter2012R2\Orchestrator",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [System.String]
        [ValidateSet("Yes","No")]
        $SendCEIPReports = "No",

        [System.String]
        [ValidateSet("Yes","No")]
        $UseMicrosoftUpdate = "No",

        [System.String]
        $InstallFolder,

        [parameter(Mandatory = $true)]
        [System.String]
        $DatabaseServer,

        [parameter(Mandatory = $true)]
        [System.String]
        $DatabaseServerInstance,

        [System.String]
        $RepositoryDatabaseName = "UsageRepositoryDB",

        [System.String]
        $StagingDatabaseName = "UsageStagingDB",

        [System.String]
        $DWDatabaseName = "UsageWarehouseDB",

        [parameter(Mandatory = $true)]
        [System.String]
        $AnalysisDatabaseServer,

        [parameter(Mandatory = $true)]
        [System.String]
        $AnalysisDatabaseServerInstance,

        [System.String]
        $AnalysisDatabaseName = "UsageAnalysisDB"
    )
 
    $result = ((Get-TargetResource @PSBoundParameters).Ensure -eq $Ensure)
    
    $result
}


Export-ModuleMember -Function *-TargetResource

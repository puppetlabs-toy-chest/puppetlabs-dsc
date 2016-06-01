function Invoke-MySqlCommand
{
    <#
    .SYNOPSIS
        This function runs the given command with the given arguments.  This
        is done so that the function can be mocked for unit testing.

    .EXAMPLE
        Invoke-MySqlCommand -CommandPath "C:\somepath.exe" -Arguments "test", "test2"

    .PARAMETER CommandPath
        This is the path to the command you want to run.

    .PARAMETER Arguments
        These are the arguments you want to supply to the command.
    #>

    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $CommandPath,

        [parameter(Mandatory = $true)]
        [string[]] $Arguments
    )

    if (Test-Path -Path $CommandPath)
    {
        & $CommandPath $Arguments
    }
    else
    {
        Throw "$CommandPath does not exist"
    }
}

function Get-MySqlInstallerConsole
{
    <#
    .SYNOPSIS
        This function returns the path for the MySQL Installer Console.

    .EXAMPLE
        Get-MySqlInstallerConsole
        C:\Program Files (x86)\MySQL\MySQL Installer for Windows\MySQLInstallerConsole.exe
    #>

    $mySqlInstallerConsole = Join-Path -Path "$(${env:ProgramFiles(x86)})\MySQL\MySQL Installer for Windows" -ChildPath "MySQLInstallerConsole.exe"

    # Throw an exception if MySQL Installer for Windows isn't installed
    if (-not (Test-Path -Path $mySqlInstallerConsole))
    {
        Throw 'Please ensure that MySQL Installer for Windows is installed'
    }

    return $mySqlInstallerConsole
}

function Get-MySqlExe
{
    <#
    .SYNOPSIS
        This function takes in a version number and returns the path of
        mysql.exe for that version.  It checks to see if the x64
        version is installed and then if the x86 version is
        installed.  If neither is installed it throws an error.

    .EXAMPLE
        Get-MySqlExe -MySqlVersion "5.6.17"
        C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql.exe

    .EXAMPLE
        Get-MySqlExe -MySqlVersion "5.6.17"
        C:\Program Files (x86)\MySQL\MySQL Server 5.6\bin\mysql.exe

    .PARAMETER MySqlVersion
        The version of MySQL you want the mysql.exe path for.
    #>

    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $MySqlVersion
    )

    $shortVersion = Get-ShortVersion -MySqlVersion $MySqlVersion
    $mySqlExeX64 = Join-Path -Path "$(${env:ProgramFiles})\MySQL\MySQL Server $shortVersion\bin" -ChildPath "mysql.exe"
    $mySqlExeX86 = Join-Path -Path "$(${env:ProgramFiles(x86)})\MySQL\MySQL Server $shortVersion\bin" -ChildPath "mysql.exe"

    # Throw an exception if the path doesn't exist
    if (Test-Path -Path $mySqlExeX64)
    {
        return $mySqlExeX64
    }
    elseif (Test-Path -Path $mySqlExeX86)
    {
        return $mySqlExeX86
    }
    else
    {
        Throw "Please ensure that MySQL Version $shortVersion is installed"
    }
}

function Get-MySqlVersionInstalled
{
    <#
    .SYNOPSIS
        This function takes in a version number and determines if that
        version of MySQL is installed.

    .EXAMPLE
        Get-MySqlVersionInstalled -MySqlVersion "5.6.17"
        True

    .EXAMPLE
        Get-MySqlVersionInstalled -MySqlVersion "5.6.17"
        False

    .PARAMETER MySqlVersion
        The MySQL version you want to know about.
    #>

    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $MySqlVersion
    )

    $MySqlInstalled  = $false
    $arguments = "community", "status"

    $statusResults = (Invoke-MySqlCommand -CommandPath $(Get-MySqlInstallerConsole) -Arguments $arguments) -split "`r`n"
 
    ForEach ($statusResult in $statusResults)
    {
        if ($statusResult -eq "MySQL Server $MySqlVersion")
        {
           $MySqlInstalled  = $true 
        }
    }

    return $MySqlInstalled
}

function Get-MySqlAllInstalled
{
    <#
    .SYNOPSIS
        This function returns all of the versions of MySQL
        that are installed.

    .EXAMPLE
        Get-MySqlAllInstalled
        5.6.17
        5.7.8

    .EXAMPLE
        Get-MySqlAllInstalled
        5.6.17
    #>

    $allVersionsInstalled = @()
    $arguments = "community", "status"

    $statusResults = (Invoke-MySqlCommand -CommandPath $(Get-MySqlInstallerConsole) -Arguments $arguments) -split "`r`n"

    ForEach ($statusResult in $statusResults)
    {
        if ($statusResult -match "^MySQL Server")
        {
            # get the version number from the $statusResult
            $splitStatus = $statusResult.Split(" ")
            $allVersionsInstalled += ,$splitStatus[2]
        }
    }

    return $allVersionsInstalled
}

function Get-ShortVersion
{
    <#
    .SYNOPSIS
        This function takes in a version number and returns the shortened
        version of it.

    .EXAMPLE
        Get-ShortVersion -MySqlVersion "5.6.17"
        5.6

    .EXAMPLE
        Get-ShortVersion -MySqlVersion "5.7.8"
        5.7

    .PARAMETER MySqlVersion
        This is the long version number that you want shortened.
    #>

    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $MySqlVersion
    )

    $splitVersion = $MySqlVersion.Split(".")
    $shortVersion = [string]::Join(".",$splitVersion,0,2)
    
    return $shortVersion
}

function Read-ErrorFile
{
    <#
    .SYNOPSIS
        This function reads an error file and throws an error if there
        is a line that starts off with ERROR.

    .EXAMPLE
        Read-ErrorFile -ErrorFilePath "C:\errorfile.txt"

    .PARAMETER ErrorFilePath
        This is the path of the error file you want read.
    #>

    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $ErrorFilePath
    )

    if (Test-Path -Path $ErrorFilePath)
    {
        ForEach ($line in (Get-Content $ErrorFilePath))
        {
            if ($line -match "^ERROR")
            {
                Remove-Item -Path $ErrorFilePath
                Throw "$line"
            }
        }
        Remove-Item -Path $ErrorFilePath
    }
}

function Get-MySqlPort
{
    <#
    .SYNOPSIS
        This function looks at the my.ini file of the version passed in
        and returns the port number from the file.

    .EXAMPLE
        Get-MySqlPort -MySqlVersion "5.6.17"
        3306

    .PARAMETER MySqlVersion
        This is the version you want the port number for.
    #>

    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $MySqlVersion
    )

    $myIniLocation = Join-Path "$(${env:ProgramData})\MySQL\MySQL Server $(Get-ShortVersion $MySqlVersion)" -ChildPath "my.ini"

    # Throw an exception if $myIniLocation doesn't exist
    if (-not (Test-Path -Path $myIniLocation))
    {
        Throw 'The my.ini file does not exist in the standard location'
    }

    ForEach ($line in (Get-Content $myIniLocation))
    {
        if ($line -match "^port=")
        {
            $mySqlPort = ($line -split '=')[1]
        }
    }
    return $mySqlPort
}

function Get-ArchitectureName
{
    <#
    .SYNOPSIS
        This function returns the architecture of the server.

    .EXAMPLE
        Get-ArchitectureName
        x64

    .EXAMPLE
        Get-ArchitectureName
        x86
    #>

    if($env:PROCESSOR_ARCHITECTURE -eq "AMD64")
    {
        return "x64"
    }
    else
    {
        return "x86"
    }
}

# Import the Networking Resource Helper Module
Import-Module -Name (Join-Path -Path (Split-Path -Path $PSScriptRoot -Parent) `
        -ChildPath (Join-Path -Path 'FileContentDsc.ResourceHelper' `
            -ChildPath 'FileContentDsc.ResourceHelper.psm1'))

# Import Localization Strings
$script:localizedData = Get-LocalizedData `
    -ResourceName 'FileContentDsc.Common' `
    -ResourcePath $PSScriptRoot

# Add the types for reading/writing INI files
Add-Type -TypeDefinition @"
    using System.IO;
    using System.Runtime.InteropServices;
    using System.Text;
    public static class IniFile
    {
        [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
        [return: MarshalAs(UnmanagedType.Bool)]
        private static extern bool WritePrivateProfileString(string lpAppName,
           string lpKeyName, string lpString, string lpFileName);
        [DllImport("kernel32.dll", CharSet = CharSet.Unicode)]
        static extern uint GetPrivateProfileString(
           string lpAppName,
           string lpKeyName,
           string lpDefault,
           StringBuilder lpReturnedString,
           uint nSize,
           string lpFileName);
        public static void WriteIniSetting(string filePath, string section, string key, string value)
        {
            string fullPath = Path.GetFullPath(filePath);
            bool result = WritePrivateProfileString(section, key, value, fullPath);
        }
        public static string GetIniSetting(string filePath, string section, string key, string defaultValue)
        {
            string fullPath = Path.GetFullPath(filePath);
            StringBuilder sb = new StringBuilder(500);
            GetPrivateProfileString(section, key, defaultValue, sb, (uint)sb.Capacity, fullPath);
            return sb.ToString();
        }
    }
"@

<#
    .SYNOPSIS
        Determines the EOL characters used in a text string.
        If non EOL characters found at all then CRLF will be
        returned.

    .PARAMETER Text
        The text to determine the EOL from.
#>
function Get-TextEolCharacter
{
    [CmdletBinding()]
    [OutputType([String])]
    param (
        [Parameter(Mandatory = $true)]
        [String]
        $Text
    )

    $eolChar = "`r`n"
    if (-not $Text.Contains("`r`n") -and $Text.Contains("`r"))
    {
        $eolChar = "`r"
    } # if

    return $eolChar
}

<#
    .SYNOPSIS
        Sets or adds the value of an entry in an INI file.

    .PARAMETER Path
        The path to the INI file to set the value in.

    .PARAMETER Section
        The section to add/set the entry in.

    .PARAMETER Key
        The name of the entry to add/set the value to.

    .PARAMETER Value
        The value to set the entry to.
#>
function Set-IniSettingFileValue
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [String]
        $Path,

        [Parameter(Mandatory = $true)]
        [String]
        $Section,

        [Parameter(Mandatory = $true)]
        [String]
        $Key,

        [Parameter(Mandatory = $true)]
        [String]
        $Value
    )

    $fullPath = Resolve-Path -Path $Path
    [IniFile]::WriteIniSetting($fullPath, $Section, $Key, $Value)
}

<#
    .SYNOPSIS
        Gets the value of an entry in an INI file.

    .PARAMETER Path
        The path to the INI file to get the entry value from.

    .PARAMETER Section
        The section to get the entry value from.

    .PARAMETER Key
        The name of the entry to get the value from.
#>
function Get-IniSettingFileValue
{
    [CmdletBinding()]
    [OutputType([String])]
    param (
        [Parameter(Mandatory = $true)]
        [String]
        $Path,

        [Parameter(Mandatory = $true)]
        [String]
        $Section,

        [Parameter(Mandatory = $true)]
        [String]
        $Key
    )

    $fullPath = Resolve-Path -Path $Path
    Return [IniFile]::GetIniSetting($fullPath, $Section, $Key, '')
}

<#
    .SYNOPSIS
        Gets file encoding. Defaults to ASCII.

    .DESCRIPTION
        The Get-FileEncoding function determines encoding by looking at Byte Order Mark (BOM).
        Based on port of C# code from http://www.west-wind.com/Weblog/posts/197245.aspx

    .EXAMPLE
        Get-ChildItem  *.ps1 | select FullName, @{n='Encoding';e={Get-FileEncoding $_.FullName}} | where {$_.Encoding -ne 'ASCII'}
        This command gets ps1 files in current directory where encoding is not ASCII

    .EXAMPLE
        Get-ChildItem  *.ps1 | select FullName, @{n='Encoding';e={Get-FileEncoding $_.FullName}} | where {$_.Encoding -ne 'ASCII'} | `
            foreach {(get-content $_.FullName) | set-content $_.FullName -Encoding ASCII}
        Same as previous example but fixes encoding using set-content
#>
function Get-FileEncoding
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)]
        [System.String]
        $Path
    )

    [byte[]]$byte = Get-Content -Encoding byte -ReadCount 4 -TotalCount 4 -Path $Path

    if ($byte[0] -eq 0xef -and $byte[1] -eq 0xbb -and $byte[2] -eq 0xbf)
    {
        return 'UTF8'
    }
    elseif ($byte[0] -eq 0xff -and $byte[1] -eq 0xfe)
    {
        return 'UTF32'
    }
    elseif ($byte[0] -eq 0xfe -and $byte[1] -eq 0xff)
    {
        return 'BigEndianUnicode'
    }
    elseif ($byte[0] -eq 0 -and $byte[1] -eq 0 -and $byte[2] -eq 0xfe -and $byte[3] -eq 0xff)
    {
        return 'BigEndianUTF32'
    }
    else
    {
        return 'ASCII'
    }
}

Export-ModuleMember -Function *

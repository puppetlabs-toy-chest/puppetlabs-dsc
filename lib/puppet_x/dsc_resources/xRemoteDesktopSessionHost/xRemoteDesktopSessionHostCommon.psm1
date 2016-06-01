function Test-xRemoteDesktopSessionHostOsRequirement
{
    return (Get-OsVersion) -ge (new-object 'Version' 6,2,9200,0)
}

function Get-OsVersion
{
    return [Environment]::OSVersion.Version 
}
Export-ModuleMember -Function @(
        'Test-xRemoteDesktopSessionHostOsRequirement'
)
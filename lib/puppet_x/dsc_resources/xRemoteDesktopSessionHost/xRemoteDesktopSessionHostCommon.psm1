function Test-xRemoteDesktopSessionHostOsRequirement
{
    return (Get-xRemoteDesktopSessionHostOsVersion) -ge (new-object 'Version' 6,2,9200,0)
}

function Get-xRemoteDesktopSessionHostOsVersion
{
    return [Environment]::OSVersion.Version 
}

Export-ModuleMember -Function @(
        'Get-xRemoteDesktopSessionHostOsVersion'
        'Test-xRemoteDesktopSessionHostOsRequirement'
)

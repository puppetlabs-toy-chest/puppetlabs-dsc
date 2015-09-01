[![Build status](https://ci.appveyor.com/api/projects/status/m6mpb7krr5ps31x3/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xwineventlog/branch/master)

# xWinEventLog

The **xWinEventLog** module contains the **xWinEventLog** DSC resource which configures the Windows Event Logs.

## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).


## Resources

### xWinEventLog

* **LogName**: Name of the event log.
* **MaximumSizeInBytes**: Size that the event log file is allowed to be. When the file reaches this maximum size it is considered full.
* **IsEnabled**: Specifies whether or not logging for the specified log is enabled.
* **LogMode**: The log mode: { AutoBackup | Circular | Retained }
* **SecurityDescriptor**: This is an SDDL string which configures access rights to the event log.

## Versions

### Unreleased

-  Added support for `-LogFilePath` in `xWinEventLog` (v1.0.0.1)

### 1.0.0.0

* Fixed Set-TargetResource function in xWinEventLog resource not to reapply if resource is in desired state already.

### 0.0.1

* Initial release with the following resource:
    - xWinEventLog

## Examples

### Configuring the MSPaint event log

```powershell
$before = Get-WinEvent -ListLog "Microsoft-Windows-MSPaint/Admin" 
Configuration Demo1
{
    Import-DscResource -module xWinEventLog
    xWinEventLog Demo1
    {
        LogName            = "Microsoft-Windows-MSPaint/Admin"
        IsEnabled          = $true
        LogMode            = "AutoBackup"
        MaximumSizeInBytes = 20mb
        LogFilePath        = "c:\logfolder\MSPaint.evtx"
    }
}
Demo1 -OutputPath $env:temp
Start-DscConfiguration -Path $env:temp -ComputerName localhost -Verbose -wait -debug
$after = Get-WinEvent -ListLog "Microsoft-Windows-MSPaint/Admin" 
$before,$after | format-table -AutoSize LogName,IsEnabled,MaximumSizeInBytes,ProviderLatency,LogMode
Get-DscConfiguration
```

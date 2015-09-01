configuration Defender
{
    Import-DscResource -ModuleName xDefender
    node Localhost
    {
        xMpPreference Test1
        {
        Name = 'MyPreferences1'
        CheckForSignaturesBeforeRunningScan = $True
        HighThreatDefaultAction = 'Clean'
        }   
    }
}

Defender -OutputPath 'c:\DSC_Defender\'
Start-DscConfiguration -Wait -Force -Path 'c:\DSC_Defender\' -ComputerName localhost -Verbose
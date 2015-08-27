configuration SetupCollector
{
    Import-DscResource -ModuleName xWindowsEventForwarding
    xWEFCollector Enabled
    {
        Ensure = "Present"
        Name = "Enabled"
    }

    xWEFSubscription TestSub
    {
        SubscriptionID = "TestSub"
        Ensure = "Present"
        SubscriptionType = 'CollectorInitiated'
        Address = 'romeo.wef.text'
        MaxItems = 5
        Query = @('Application:*','System:*[System[(EventID=99)]]')
        DependsOn = "[xWEFCollector]Enabled"
    } 

}
SetupCollector -out c:\DSC\ -force
Start-DscConfiguration -Wait -Force -Path c:\DSC\ -Verbose
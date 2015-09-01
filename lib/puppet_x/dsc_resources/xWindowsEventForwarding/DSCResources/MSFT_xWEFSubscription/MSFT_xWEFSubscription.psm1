function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $SubscriptionID,

        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = 'Present',

        [parameter(Mandatory = $true)]
        [ValidateSet("CollectorInitiated","SourceInitiated")]
        [System.String]
        $SubscriptionType
    )

    if ((get-service wecsvc).Status -ne 'Running') {throw 'The xWEFSubscription resource requires that the Wecsvc service be in a running state.  Set the xWEFCollectorService resource to Ensure = Present or use wecutil qc.'}

    $EnumSubs = wecutil es
    if ($EnumSubs -contains $SubscriptionID) {
        [xml]$GetSub = wecutil gs $SubscriptionID /format:xml
    }

    $returnValue = @{
        SubscriptionID = [System.String]$GetSub.Subscription.SubscriptionId
        Ensure = if ($Ensure -eq 'Present' -AND $EnumSubs -contains $SubscriptionID) {[System.String]'Present'} else {$null}
        SubscriptionType = [System.String]$GetSub.Subscription.SubscriptionType
        Description = [System.String]$GetSub.Subscription.Description
        Enabled = [System.String]$GetSub.Subscription.Enabled
        DeliveryMode = [System.String]$GetSub.Subscription.Delivery.Mode
        MaxItems = [System.Int32]$GetSub.Subscription.Delivery.Batching.MaxItems
        MaxLatencyTime = [System.UInt64]$GetSub.Subscription.Delivery.Batching.MaxLatencyTime
        HeartBeatInterval = [System.UInt64]$GetSub.Subscription.Delivery.PushSettings.Heartbeat.Interval
        ReadExistingEvents = [System.String]$GetSub.Subscription.ReadExistingEvents
        TransportName = [System.String]$GetSub.Subscription.TransportName
        ContentFormat = [System.String]$GetSub.Subscription.ContentFormat
        Locale = [System.String]$GetSub.Subscription.Locale.Language
        LogFile = [System.String]$GetSub.Subscription.LogFile
        CredentialsType = [System.String]$GetSub.Subscription.CredentialsType
        AllowedSourceNonDomainComputers = [System.String[]]$GetSub.Subscription.AllowedSourceNonDomainComputers
        AllowedSourceDomainComputers = [System.String]$GetSub.Subscription.AllowedSourceDomainComputers
        Query = [System.String[]]$GetSub.Subscription.Query.'#cdata-section'
    }

    $returnValue
}
# Get-TargetResource -SubscriptionID TestSub -Ensure Present -SubscriptionType CollectorInitiated


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $SubscriptionID,

        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = 'Present',

        [parameter(Mandatory = $true)]
        [ValidateSet("CollectorInitiated","SourceInitiated")]
        [System.String]
        $SubscriptionType,

        [System.String]
        $Description,

        [ValidateSet("true","false")]
        [System.String]
        $Enabled = 'true',

        [ValidateSet("Push","Pull")]
        [System.String]
        $DeliveryMode = 'Push',

        [System.Int32]
        $MaxItems = 1,

        [System.UInt64]
        $MaxLatencyTime = 20000,

        [System.UInt64]
        $HeartBeatInterval = 20000,

        [ValidateSet("true","false")]
        [System.String]
        $ReadExistingEvents = 'false',

        [ValidateSet("HTTP","HTTPS")]
        [System.String]
        $TransportName = 'HTTP',

        [System.String]
        $TransportPort = '5985',

        [System.String]
        $ContentFormat = 'RenderedText',

        [System.String]
        $Locale = 'en-US',

        [System.String]
        $LogFile = 'ForwardedEvents',

        [ValidateSet("Default","Basic","Negotiate","Digest")]
        [System.String]
        $CredentialsType = 'Default',

        [System.String[]]
        $AllowedSourceNonDomainComputers,

        [System.String]
        $AllowedSourceDomainComputers = 'O:NSG:NSD:(A;;GA;;;DC)(A;;GA;;;NS)',

        [System.String[]]
        $Query = @('Application:*','System:*'),

        [System.String[]]
        $Address = @('source.wef.test')
    )
    
    if ((get-service wecsvc).Status -ne 'Running') {throw 'The xWEFSubscription resource requires that the Wecsvc service be in a running state.  Set the xWEFCollectorService resource to Ensure = Present or use wecutil qc.'}

    if ($Ensure -eq 'Present') {
    $Create = @"
<?xml version="1.0" encoding="UTF-8"?>
<Subscription xmlns="http://schemas.microsoft.com/2006/03/windows/events/subscription">
    <SubscriptionId>$SubscriptionID</SubscriptionId>
    <SubscriptionType>$SubscriptionType</SubscriptionType>
    <Description>$Description</Description>
    <Enabled>$Enabled</Enabled>
    <Uri>http://schemas.microsoft.com/wbem/wsman/1/windows/EventLog</Uri>
    <ConfigurationMode>Custom</ConfigurationMode>
    <Delivery Mode="$DeliveryMode">
            <Batching>
                <MaxItems>$MaxItems</MaxItems>
                <MaxLatencyTime>$MaxLatencyTime</MaxLatencyTime>
            </Batching>
            <PushSettings>
                <Heartbeat Interval="$HeartbeatInterval"/>
            </PushSettings>
    </Delivery>
    <Query>
        <![CDATA[<QueryList><Query Id="0">
"@

    foreach ($q in $Query){
        $h = Convert-QueryString $q
        $Create += @"
<Select Path="$($h.Path)">$($h.Select)</Select>
"@
    }

    $Create += @"
</Query></QueryList>]]>
    </Query>
    <ReadExistingEvents>$ReadExistingEvents</ReadExistingEvents>
    <TransportName>$TransportName</TransportName>
    <TransportPort>$TransportPort</TransportPort>
    <ContentFormat>$ContentFormat</ContentFormat>
    <Locale Language="$Locale"/>
    <LogFile>$LogFile</LogFile>
    <PublisherName>Microsoft-Windows-EventCollector</PublisherName>
    <CredentialsType>$CredentialsType</CredentialsType>

"@

    if ($SubscriptionType -eq 'CollectorInitiated') {
    $Create += @"
    <EventSources>

"@
    foreach ($a in $Address) {
    $Create += @"
       <EventSource Enabled="true">
            <Address>$a</Address>
        </EventSource>
"@
    }
    $Create += @"

    </EventSources>
"@
    }

    if ($SubscriptionType -eq 'SourceInitiated') {
    $Create += @"
    <AllowedSourceNonDomainComputers>$AllowedSourceNonDomainComputers</AllowedSourceNonDomainComputers>
    <AllowedSourceDomainComputers>$AllowedSourceDomainComputers</AllowedSourceDomainComputers>
"@
    }

    $Create += @"

</Subscription>
"@
    Write-Verbose "SubscriptionID: $SubscriptionID"
    $TempFileName = "$([system.guid]::newguid().guid).tmp"
    $Create | Set-Content $env:TEMP\$TempFileName

    $EnumSubs = wecutil es
    if ($EnumSubs -contains $SubscriptionID) {
        WecUtil ds $subscriptionid
    }
    WecUtil cs $env:TEMP\$TempFileName

    Remove-Item $env:TEMP\$TempFileName -Force
    }

    if ($Ensure -eq 'Absent') {
        $EnumSubs = wecutil es
        if ($EnumSubs -contains $SubscriptionID) {
            wecutil ds $SubscriptionID
        }
    }
}
# Set-TargetResource -SubscriptionID TestSub -Ensure Present -SubscriptionType CollectorInitiated


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $SubscriptionID,

        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = 'Present',

        [parameter(Mandatory = $true)]
        [ValidateSet("CollectorInitiated","SourceInitiated")]
        [System.String]
        $SubscriptionType,

        [System.String]
        $Description,

        [ValidateSet("true","false")]
        [System.String]
        $Enabled = 'true',

        [ValidateSet("Push","Pull")]
        [System.String]
        $DeliveryMode = 'Push',

        [System.Int32]
        $MaxItems = 1,

        [System.UInt64]
        $MaxLatencyTime = 20000,

        [System.UInt64]
        $HeartBeatInterval = 20000,

        [ValidateSet("true","false")]
        [System.String]
        $ReadExistingEvents = 'false',

        [ValidateSet("HTTP","HTTPS")]
        [System.String]
        $TransportName = 'HTTP',

        [System.String]
        $TransportPort = '5985',

        [System.String]
        $ContentFormat = 'RenderedText',

        [System.String]
        $Locale = 'en-US',

        [System.String]
        $LogFile = 'ForwardedEvents',

        [ValidateSet("Default","Basic","Negotiate","Digest")]
        [System.String]
        $CredentialsType = 'Default',

        [System.String[]]
        $AllowedSourceNonDomainComputers,

        [System.String]
        $AllowedSourceDomainComputers = 'O:NSG:NSD:(A;;GA;;;DC)(A;;GA;;;NS)',

        [System.String[]]
        $Query = @('Application:*','System:*'),

        [System.String[]]
        $Address = @('source.wef.test')
    )
    
    if ((get-service wecsvc).Status -ne 'Running') {throw 'The xWEFSubscription resource requires that the Wecsvc service be in a running state.  Set the xWEFCollectorService resource to Ensure = Present or use wecutil qc.'}

    $Get = Get-TargetResource -SubscriptionID $SubscriptionID -SubscriptionType $SubscriptionType
    
    $result = [System.Boolean]$true

    foreach ($g in $Get.Keys) {
        if ($PSBoundParameters.$g) {
            $test = $Get.$g -eq $PSBoundParameters.$g
            if ($test -eq [System.Boolean]$false) {$result = [System.Boolean]$false}
            }
    }
    
    $result
}
# Test-TargetResource -SubscriptionID TestSub -Ensure Present -SubscriptionType CollectorInitiated


function Convert-QueryString {
param (
[parameter(Mandatory = $true)]
[string[]]
$string
)
    return @{Path=$($string.split(':')[0]);Select=$($string.split(':')[1])}
}


Export-ModuleMember -Function *-TargetResource
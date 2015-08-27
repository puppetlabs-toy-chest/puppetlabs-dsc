[![Build status](https://ci.appveyor.com/api/projects/status/8ds3u9f79v2cwx54/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xwindowseventforwarding/branch/master)

# xWindowsEventForwarding

The **xWindowsEventForwarding** module is a part of the Windows PowerShell Desired State Configuration (DSC) Resource Kit, which is a collection of DSC Resources. This module contains the **xWEFCollector and xWEFSubscription** resources. These resources enable you to configure a server to become an Event Collector role and create complex Subscriptions, with simple declarative language.

**All of the resources in the DSC Resource Kit are provided AS IS, and are not supported through any Microsoft standard support program or service. The "x" in xWindowsEventForwarding stands for experimental**, which means that these resources will be **fix forward** and monitored by the module owner(s).

Please leave comments, feature requests, and bug reports in the Q & A tab for
this module.

If you would like to modify the **xWindowsEventForwarding** module, feel free. When modifying, please update the module name, resource friendly name, and MOF class name (instructions below). As specified in the license, you may copy or modify this resource as long as they are used on the Windows Platform.

For more information about Windows PowerShell Desired State Configuration, check out the blog posts on the [PowerShell Blog](http://blogs.msdn.com/b/powershell/) ([this](http://blogs.msdn.com/b/powershell/archive/2013/11/01/configuration-in-a-devops-world-windows-powershell-desired-state-configuration.aspx) is a good starting point). There are also great community resources, such as [PowerShell.org](http://powershell.org/wp/tag/dsc/), or [PowerShell Magazine](http://www.powershellmagazine.com/tag/dsc/). For more information on the DSC Resource Kit, checkout [this blog post](http://go.microsoft.com/fwlink/?LinkID=389546).

Installation
------------

To install **xWindowsEventForwarding** module

-   If you are using WMF4 / PowerShell Version 4: Unzip the content under $env:ProgramFilesWindowsPowerShellModules folder

-   If you are using WMF5 Preview: From an elevated PowerShell session run ‘Install-Module xWindowsEventForwarding’

To confirm installation

-   Run Get-DSCResource to see that the resources listed above are among the DSC Resources displayed

Requirements
------------

This module requires the latest version of PowerShell (v4.0, which ships in
Windows 8.1 or Windows Server 2012R2). To easily use PowerShell 4.0 on older
operating systems, install WMF 4.0. Please read the installation instructions
that are present on both the download page and the release notes for WMF 4.0.

Details
-------

**xWEFCollector** resource has following properties

- **Ensure**: Determines whether the Collector service should be enabled or disabled
- **Name**: Provide a unique name for the setting

**xWEFSubscription** resource has the following properties

- **SubscriptionID**: Name of the Subscription
- **Ensure**: Determines whether to validate or remove the scubscription
- **SubscriptionType**: Type of Subscription to create
- **Description**: Description of the Collector subscription
- **Enabled**: Sets whether the subscription will be enabled, default true
- **DeliveryMode**: Configures whether the collector will pull events from source nodes or if the source nodes will push events to the collector, default push
- **MaxItems**: The number of events that can occur on the source before they are submitted to the collector, default 1
- **MaxLatencyTime**: The maximum amount of time that can pass before events are submitted to the collector, default 20000
- **HeartBeatInterval**: Frequency to verify connectivity, default 20000
- **ReadExistingEvents**: Should the collector read existing or only new events, default false
- **TransportName**: Determines whether to require SSL, default HTTP
- **TransportPort**: Set the port number that WinRM should use to make a connection, default 5985
- **ContentFormat**: Format that event logs will be submitted in, default RenderedText
- **Locale**: Sets the subscription Locale, default en-US
- **LogFile**: Sets the event log that the collected events will be written to, default ForwardedEvents
- **CredentialsType**: Sets the credential type used for authenticating to WinRM, default Default
- **AllowedSourceNonDomainComputers**: This parameter has not been fully implemented, only required for source initiated scenarios, provide XML to set IssuerCAList, AllowedSubjectList, or DeniedSubjectList if this will be used, default empty string
- **AllowedSourceDomainComputers**: In Source Initiated scenario this SDDL determines who can push events, default O:NSG:NSD:(A;;GA;;;DC)(A;;GA;;;NS) which equates to Domain Computers and Network Service
- **Query**: Expects an array of hashtables that set which events should be collected, default is all application and system logs
- **Address**: Expects an array of source node FQDNs, default source.wef.test to prevent errors when only staging test subscription

Scenario
--------

Windows Event Forwarding can be used in either a Collector Initiated or Source Initiated configuration.  Depending on the configuration there are unique combinations of parameters that should be used.  Before using this resource, it would be good understand the details of [WECUtil.exe](https://msdn.microsoft.com/en-us/library/windows/desktop/bb736545(v=vs.85).aspx).  That is the basis for the resource.

There is also [an article on MSDN](https://msdn.microsoft.com/en-us/library/windows/desktop/bb427443(v=vs.85).aspx) that provides a high level understanding of how Windows Event Forwarding should be configured.

In addition, For Windows Event Collection to function there are requirements that must be met on the Collector as well as on the servers that act as the Source of forwarded events.  In a Collector Initiated configuration, the only required change to the source machines will be to add the Collector machine domain account to the local **Event Log Readers** group.  In a Source Initiated configuration, DSC must be used in combination with Group Policy to configure the source machines with the Collector address before events will be forwarded.

### Event Queries ###

In order to simplify querying for specific event logs, the following pattern is used.

"Log:Query"

So to query the application log for all events, the query would be "Application:*".  The easiest way to identify the proper syntax for the right side of the colon delimiter is to use Windows Event Log and begin to create a new subscription, then view the XML representation of the query (copy and paste).

For multiple queries, comma separate multiple strings in an array.

@('Application:*','System:*[System[(EventID=99)]]')

### List of Source Machines ###

In a Collector Initiated scenario, a list of source machines must be provided.  The Address parameter fulfills this requirement.  When more than one machine is to be listed, provide an array of FQDNs.

@('system1.domain.com', 'system2.domain.com')


Renaming Requirements
---------------------

When making changes to these resources, we suggest the following practice

1. Update the following names by replacing MSFT with your company/community name
and replacing the **"x" with **"c" (short for "Community") or another prefix of your
choice
 -	Module name (ex: xModule becomes cModule)
 -	Resource folder (ex: MSFT\_xResource becomes Contoso\_xResource)
 -	Resource Name (ex: MSFT\_xResource becomes Contoso\_cResource)
 -	Resource Friendly Name (ex: xResource becomes cResource)
 -	MOF class name (ex: MSFT\_xResource becomes Contoso\_cResource)
 -	Filename for the <resource\>.schema.mof (ex: MSFT\_xResource.schema.mof becomes Contoso\_cResource.schema.mof)

2. Update module and metadata information in the module manifest  
3. Update any configuration that use these resources

We reserve resource and module names without prefixes ("x" or "c") for future use (e.g. "MSFT_Resource"). If the next version of Windows Server ships with a "WindowsEventForwarding" resource, we don't want to break any configurations that use any community modifications. Please keep a prefix such as "c" on all community modifications.

Versions
--------

### 1.0.0.0
* Initial release of xWindowsEventForwarding module with following modules:
	* xWEFCollector
	* xWEFSubscription

Examples
--------

**Example 1**:  Enable Collector role and a subscription that includes all Application
and System logs from server tester.contoso.com.

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
	        Address = 'tester.contoso.com'
	        DependsOn = "[xWEFCollector]Enabled"
	    } 
	}
	SetupCollector -out c:\DSC\ -force
	Start-DscConfiguration -Wait -Force -Path c:\DSC\ -Verbose

	# Note that this configuration will apply to the Collector node.  On Source
	# nodes the machine account of the Collector must be added to the local
	# group "Event Log Readers".

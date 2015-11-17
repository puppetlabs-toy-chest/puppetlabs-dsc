## Resource Types included with DSC module
For any system this module is installed on, use
`Puppet describe typename` for more information.

#### WMF Core Types

Puppet Type | DSC Resource
----------- | -----------------
dsc_archive | [Archive](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_ArchiveResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_ArchiveResource/MSFT_ArchiveResource.schema.mof
dsc_environment | [Environment](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_EnvironmentResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_EnvironmentResource/MSFT_EnvironmentResource.schema.mof
dsc_file | [File](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_FileDirectoryConfiguration) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_FileDirectoryConfiguration/MSFT_FileDirectoryConfiguration.schema.mof
dsc_group | [Group](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_GroupResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_GroupResource/MSFT_GroupResource.schema.mof
dsc_log | [Log](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_LogResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_LogResource/MSFT_LogResource.schema.mof
dsc_package | [Package](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_PackageResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_PackageResource/MSFT_PackageResource.schema.mof
dsc_windowsprocess | [WindowsProcess](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_ProcessResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_ProcessResource/MSFT_ProcessResource.schema.mof
dsc_registry | [Registry](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_RegistryResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_RegistryResource/MSFT_RegistryResource.schema.mof
dsc_windowsfeature | [WindowsFeature](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_RoleResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_RoleResource/MSFT_RoleResource.schema.mof
dsc_script | [Script](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_ScriptResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_ScriptResource/MSFT_ScriptResource.schema.mof
dsc_service | [Service](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_ServiceResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_ServiceResource/MSFT_ServiceResource.schema.mof
dsc_user | [User](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_UserResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_UserResource/MSFT_UserResource.schema.mof
dsc_windowsoptionalfeature | [WindowsOptionalFeature](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_WindowsOptionalFeature) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_WindowsOptionalFeature/MSFT_WindowsOptionalFeature.schema.mof

#### Community x Prefixed types

##### xActiveDirectory

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xaddomain | [xADDomain](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xActiveDirectory/DSCResources/MSFT_xADDomain) | [repo](https://github.com/PowerShell/xActiveDirectory)
dsc_xaddomaincontroller | [xADDomainController](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xActiveDirectory/DSCResources/MSFT_xADDomainController) | [repo](https://github.com/PowerShell/xActiveDirectory)
dsc_xaddomaintrust | [xADDomainTrust](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xActiveDirectory/DSCResources/MSFT_xADDomainTrust) | [repo](https://github.com/PowerShell/xActiveDirectory)
dsc_xadrecyclebin | [xADRecycleBin](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xActiveDirectory/DSCResources/MSFT_xADRecycleBin) | [repo](https://github.com/PowerShell/xActiveDirectory)
dsc_xaduser | [xADUser](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xActiveDirectory/DSCResources/MSFT_xADUser) | [repo](https://github.com/PowerShell/xActiveDirectory)
dsc_xwaitforaddomain | [xWaitForADDomain](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xActiveDirectory/DSCResources/MSFT_xWaitForADDomain) | [repo](https://github.com/PowerShell/xActiveDirectory)

##### xAdcsDeployment

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xadcscertificationauthority | [xAdcsCertificationAuthority](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAdcsDeployment/DSCResources/MSFT_xAdcsCertificationAuthority) | [repo](https://github.com/PowerShell/xAdcsDeployment)
dsc_xadcswebenrollment | [xAdcsWebEnrollment](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAdcsDeployment/DSCResources/MSFT_xAdcsWebEnrollment) | [repo](https://github.com/PowerShell/xAdcsDeployment)

##### xCertificateServices

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xadcscertificationauthority | [xAdcsCertificationAuthority](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAdcsDeployment/xCertificateServices/DSCResources/MSFT_xAdcsCertificationAuthority) | [repo](https://github.com/PowerShell/xCertificateServices)
dsc_xadcswebenrollment | [xAdcsWebEnrollment](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAdcsDeployment/xCertificateServices/DSCResources/MSFT_xAdcsWebEnrollment) | [repo](https://github.com/PowerShell/xCertificateServices)

##### xAzure

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xazureaffinitygroup | [xAzureAffinityGroup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAzure/DSCResources/MSFT_xAzureAffinityGroup) | [repo](https://github.com/PowerShell/xAzure)
dsc_xazurequickvm | [xAzureQuickVM](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAzure/DSCResources/MSFT_xAzureQuickVM) | [repo](https://github.com/PowerShell/xAzure)
dsc_xazureservice | [xAzureService](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAzure/DSCResources/MSFT_xAzureService) | [repo](https://github.com/PowerShell/xAzure)
dsc_xazuresqldatabase | [xAzureSqlDatabase](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAzure/DSCResources/MSFT_xAzureSqlDatabase) | [repo](https://github.com/PowerShell/xAzure)
dsc_xazuresqldatabaseserverfirewallrule | [xAzureSqlDatabaseServerFirewallRule](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAzure/DSCResources/MSFT_xAzureSqlDatabaseServerFirewallRule) | [repo](https://github.com/PowerShell/xAzure)
dsc_xazurestorageaccount | [xAzureStorageAccount](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAzure/DSCResources/MSFT_xAzureStorageAccount) | [repo](https://github.com/PowerShell/xAzure)
dsc_xazuresubscription | [xAzureSubscription](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAzure/DSCResources/MSFT_xAzureSubscription) | [repo](https://github.com/PowerShell/xAzure)
dsc_xazurevm | [xAzureVM](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAzure/DSCResources/MSFT_xAzureVM) | [repo](https://github.com/PowerShell/xAzure)
dsc_xazurevmdscconfiguration | [xAzureVMDscConfiguration](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAzure/DSCResources/MSFT_xAzureVMDscConfiguration) | [repo](https://github.com/PowerShell/xAzure)
dsc_xazurevmdscextension | [xAzureVMDscExtension](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAzure/DSCResources/MSFT_xAzureVMDscExtension) | [repo](https://github.com/PowerShell/xAzure)

##### xAzurePack

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xazurepackadmin | [xAzurePackAdmin](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAzurePack/DSCResources/MSFT_xAzurePackAdmin) | [repo](https://github.com/PowerShell/xAzurePack)
dsc_xazurepackdatabasesetting | [xAzurePackDatabaseSetting](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAzurePack/DSCResources/MSFT_xAzurePackDatabaseSetting) | [repo](https://github.com/PowerShell/xAzurePack)
dsc_xazurepackfqdn | [xAzurePackFQDN](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAzurePack/DSCResources/MSFT_xAzurePackFQDN) | [repo](https://github.com/PowerShell/xAzurePack)
dsc_xazurepackidentityprovider | [xAzurePackIdentityProvider](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAzurePack/DSCResources/MSFT_xAzurePackIdentityProvider) | [repo](https://github.com/PowerShell/xAzurePack)
dsc_xazurepackrelyingparty | [xAzurePackRelyingParty](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAzurePack/DSCResources/MSFT_xAzurePackRelyingParty) | [repo](https://github.com/PowerShell/xAzurePack)
dsc_xazurepackresourceprovider | [xAzurePackResourceProvider](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAzurePack/DSCResources/MSFT_xAzurePackResourceProvider) | [repo](https://github.com/PowerShell/xAzurePack)
dsc_xazurepacksetup | [xAzurePackSetup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAzurePack/DSCResources/MSFT_xAzurePackSetup) | [repo](https://github.com/PowerShell/xAzurePack)
dsc_xazurepackupdate | [xAzurePackUpdate](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAzurePack/DSCResources/MSFT_xAzurePackUpdate) | [repo](https://github.com/PowerShell/xAzurePack)

##### xBitlocker

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xblautobitlocker | [xBLAutoBitlocker](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xBitlocker/DSCResources/MSFT_xBLAutoBitlocker) | [repo](https://github.com/PowerShell/xBitlocker)
dsc_xblbitlocker | [xBLBitlocker](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xBitlocker/DSCResources/MSFT_xBLBitlocker) | [repo](https://github.com/PowerShell/xBitlocker)
dsc_xbltpm | [xBLTpm](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xBitlocker/DSCResources/MSFT_xBLTpm) | [repo](https://github.com/PowerShell/xBitlocker)

##### xCertificate

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xcertreq | [xCertReq](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xCertificate/DSCResources/MSFT_xCertReq) | [repo](https://github.com/PowerShell/xCertificate)

##### xComputerManagement

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xcomputer | [xComputer](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xComputerManagement/DSCResources/MSFT_xComputer) | [repo](https://github.com/PowerShell/xComputerManagement)

##### xCredSSP

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xcredssp | [xCredSSP](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xCredSSP/DSCResources/MSFT_xCredSSP) | [repo](https://github.com/PowerShell/xCredSSP)

##### xDatabase

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xdbpackage | [xDBPackage](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xDatabase/DSCResources/MSFT_xDBPackage) | [repo](https://github.com/PowerShell/xDatabase)
dsc_xdatabase | [xDatabase](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xDatabase/DSCResources/MSFT_xDatabase) | [repo](https://github.com/PowerShell/xDatabase)
dsc_xdatabaselogin | [xDatabaseLogin](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xDatabase/DSCResources/MSFT_xDatabaseLogin) | [repo](https://github.com/PowerShell/xDatabase)
dsc_xdatabaseserver | [xDatabaseServer](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xDatabase/DSCResources/MSFT_xDatabaseServer) | [repo](https://github.com/PowerShell/xDatabase)

##### xDefender

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xmppreference | [xMpPreference](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xDefender/DSCResources/MSFT_xMpPreference) | [repo](https://github.com/PowerShell/xDefender)

##### xDhcpServer

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xdhcpserveroption | [xDhcpServerOption](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xDhcpServer/DSCResources/MSFT_xDhcpServerOption) | [repo](https://github.com/PowerShell/xDhcpServer)
dsc_xdhcpserverreservation | [xDhcpServerReservation](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xDhcpServer/DSCResources/MSFT_xDhcpServerReservation) | [repo](https://github.com/PowerShell/xDhcpServer)
dsc_xdhcpserverscope | [xDhcpServerScope](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xDhcpServer/DSCResources/MSFT_xDhcpServerScope) | [repo](https://github.com/PowerShell/xDhcpServer)

##### xDismFeature

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xdismfeature | [xDismFeature](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xDismFeature/DSCResources/MSFT_xDismFeature) | [repo](https://github.com/PowerShell/xDismFeature)

##### xDnsServer

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xdnsarecord | [xDnsARecord](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xDnsServer/DSCResources/MSFT_xDnsARecord) | [repo](https://github.com/PowerShell/xDnsServer)
dsc_xdnsserversecondaryzone | [xDnsServerSecondaryZone](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xDnsServer/DSCResources/MSFT_xDnsServerSecondaryZone) | [repo](https://github.com/PowerShell/xDnsServer)
dsc_xdnsserverzonetransfer | [xDnsServerZoneTransfer](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xDnsServer/DSCResources/MSFT_xDnsServerZoneTransfer) | [repo](https://github.com/PowerShell/xDnsServer)

##### xExchange

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xexchactivesyncvirtualdirectory | [xExchActiveSyncVirtualDirectory](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchActiveSyncVirtualDirectory) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchantimalwarescanning | [xExchAntiMalwareScanning](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchAntiMalwareScanning) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchautomountpoint | [xExchAutoMountPoint](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchAutoMountPoint) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchautodiscovervirtualdirectory | [xExchAutodiscoverVirtualDirectory](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchAutodiscoverVirtualDirectory) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchclientaccessserver | [xExchClientAccessServer](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchClientAccessServer) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchdatabaseavailabilitygroup | [xExchDatabaseAvailabilityGroup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchDatabaseAvailabilityGroup) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchdatabaseavailabilitygroupmember | [xExchDatabaseAvailabilityGroupMember](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchDatabaseAvailabilityGroupMember) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchdatabaseavailabilitygroupnetwork | [xExchDatabaseAvailabilityGroupNetwork](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchDatabaseAvailabilityGroupNetwork) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchecpvirtualdirectory | [xExchEcpVirtualDirectory](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchEcpVirtualDirectory) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexcheventloglevel | [xExchEventLogLevel](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchEventLogLevel) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchexchangecertificate | [xExchExchangeCertificate](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchExchangeCertificate) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchexchangeserver | [xExchExchangeServer](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchExchangeServer) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchimapsettings | [xExchImapSettings](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchImapSettings) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchinstall | [xExchInstall](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchInstall) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchjetstress | [xExchJetstress](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchJetstress) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchjetstresscleanup | [xExchJetstressCleanup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchJetstressCleanup) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchmailboxdatabase | [xExchMailboxDatabase](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchMailboxDatabase) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchmailboxdatabasecopy | [xExchMailboxDatabaseCopy](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchMailboxDatabaseCopy) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchmailboxserver | [xExchMailboxServer](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchMailboxServer) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchmaintenancemode | [xExchMaintenanceMode](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchMaintenanceMode) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchmapivirtualdirectory | [xExchMapiVirtualDirectory](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchMapiVirtualDirectory) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchoabvirtualdirectory | [xExchOabVirtualDirectory](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchOabVirtualDirectory) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchoutlookanywhere | [xExchOutlookAnywhere](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchOutlookAnywhere) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchowavirtualdirectory | [xExchOwaVirtualDirectory](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchOwaVirtualDirectory) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchpopsettings | [xExchPopSettings](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchPopSettings) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchpowershellvirtualdirectory | [xExchPowerShellVirtualDirectory](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchPowershellVirtualDirectory) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchreceiveconnector | [xExchReceiveConnector](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchReceiveConnector) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchtransportservice | [xExchTransportService](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchTransportService) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchumcallroutersettings | [xExchUMCallRouterSettings](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchUMCallRouterSettings) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchumservice | [xExchUMService](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchUMService) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchwaitforadprep | [xExchWaitForADPrep](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchWaitForADPrep) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchwaitfordag | [xExchWaitForDAG](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchWaitForDAG) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchwaitformailboxdatabase | [xExchWaitForMailboxDatabase](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchWaitForMailboxDatabase) | [repo](https://github.com/PowerShell/xExchange)
dsc_xexchwebservicesvirtualdirectory | [xExchWebServicesVirtualDirectory](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xExchange/DSCResources/MSFT_xExchWebServicesVirtualDirectory) | [repo](https://github.com/PowerShell/xExchange)

##### xFailOverCluster

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xcluster | [xCluster](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xFailOverCluster/DSCResources/MSFT_xCluster) | [repo](https://github.com/PowerShell/xFailOverCluster)
dsc_xwaitforcluster | [xWaitForCluster](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xFailOverCluster/DSCResources/MSFT_xWaitForCluster) | [repo](https://github.com/PowerShell/xFailOverCluster)

##### xHyper-V

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xvhd | [xVHD](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xHyper-V/DSCResources/MSFT_xVHD) | [repo](https://github.com/PowerShell/xHyper-V)
dsc_xvmhyperv | [xVMHyperV](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xHyper-V/DSCResources/MSFT_xVMHyperV) | [repo](https://github.com/PowerShell/xHyper-V)
dsc_xvmswitch | [xVMSwitch](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xHyper-V/DSCResources/MSFT_xVMSwitch) | [repo](https://github.com/PowerShell/xHyper-V)
dsc_xvhdfile | [xVhdFile](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xHyper-V/DSCResources/MSFT_xVhdFileDirectory) | [repo](https://github.com/PowerShell/xHyper-V)

##### xInternetExplorerHomePage

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xinternetexplorerhomepage | [xInternetExplorerHomePage](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xInternetExplorerHomePage/DSCResources/xInternetExplorerHomePage) | [repo](https://github.com/PowerShell/xInternetExplorerHomePage)

##### xJea

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xjeaendpoint | [xJeaEndPoint](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xJea/DSCResources/MSFT_xJeaEndpoint) | [repo](https://github.com/PowerShell/xJea)
dsc_xjeatoolkit | [xJeaToolKit](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xJea/DSCResources/MSFT_xJeaToolkit) | [repo](https://github.com/PowerShell/xJea)

##### xMySql

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xmysqldatabase | [xMySqlDatabase](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xMySql/DscResources/MSFT_xMySqlDatabase) | [repo](https://github.com/PowerShell/xMySql)
dsc_xmysqlgrant | [xMySqlGrant](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xMySql/DscResources/MSFT_xMySqlGrant) | [repo](https://github.com/PowerShell/xMySql)
dsc_xmysqlserver | [xMySqlServer](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xMySql/DscResources/MSFT_xMySqlServer) | [repo](https://github.com/PowerShell/xMySql)
dsc_xmysqluser | [xMySqlUser](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xMySql/DscResources/MSFT_xMySqlUser) | [repo](https://github.com/PowerShell/xMySql)

##### xNetworking

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xdnsserveraddress | [xDNSServerAddress](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xNetworking/DSCResources/MSFT_xDNSServerAddress) | [repo](https://github.com/PowerShell/xNetworking)
dsc_xdefaultgatewayaddress | [xDefaultGatewayAddress](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xNetworking/DSCResources/MSFT_xDefaultGatewayAddress) | [repo](https://github.com/PowerShell/xNetworking)
dsc_xfirewall | [xFirewall](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xNetworking/DSCResources/MSFT_xFirewall) | [repo](https://github.com/PowerShell/xNetworking)
dsc_xipaddress | [xIPAddress](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xNetworking/DSCResources/MSFT_xIPAddress) | [repo](https://github.com/PowerShell/xNetworking)

##### xPSDesiredStateConfiguration

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xarchive | [xArchive](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xPSDesiredStateConfiguration/DSCResources/MSFT_xArchive) | [repo](https://github.com/PowerShell/xPSDesiredStateConfiguration)
dsc_xdscwebservice | [xDSCWebService](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xPSDesiredStateConfiguration/DSCResources/MSFT_xDSCWebService) | [repo](https://github.com/PowerShell/xPSDesiredStateConfiguration)
dsc_xgroup | [xGroup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xPSDesiredStateConfiguration/DSCResources/MSFT_xGroupResource) | [repo](https://github.com/PowerShell/xPSDesiredStateConfiguration)
dsc_xpsendpoint | [xPSEndpoint](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xPSDesiredStateConfiguration/DSCResources/MSFT_xPSSessionConfiguration) | [repo](https://github.com/PowerShell/xPSDesiredStateConfiguration)
dsc_xpackage | [xPackage](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xPSDesiredStateConfiguration/DSCResources/MSFT_xPackageResource) | [repo](https://github.com/PowerShell/xPSDesiredStateConfiguration)
dsc_xwindowsprocess | [xWindowsProcess](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xPSDesiredStateConfiguration/DSCResources/MSFT_xProcessResource) | [repo](https://github.com/PowerShell/xPSDesiredStateConfiguration)
dsc_xremotefile | [xRemoteFile](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xPSDesiredStateConfiguration/DSCResources/MSFT_xRemoteFile) | [repo](https://github.com/PowerShell/xPSDesiredStateConfiguration)
dsc_xservice | [xService](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xPSDesiredStateConfiguration/DSCResources/MSFT_xServiceResource) | [repo](https://github.com/PowerShell/xPSDesiredStateConfiguration)
dsc_xwindowsoptionalfeature | [xWindowsOptionalFeature](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xPSDesiredStateConfiguration/DSCResources/MSFT_xWindowsOptionalFeature) | [repo](https://github.com/PowerShell/xPSDesiredStateConfiguration)

##### xPendingReboot

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xpendingreboot | [xPendingReboot](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xPendingReboot/DSCResources/MSFT_xPendingReboot) | [repo](https://github.com/PowerShell/xPendingReboot)

##### xPowerShellExecutionPolicy

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xpowershellexecutionpolicy | [xPowerShellExecutionPolicy](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xPowerShellExecutionPolicy/DSCResources/xPowerShellExecutionPolicy) | [repo](https://github.com/PowerShell/xPowerShellExecutionPolicy)

##### xRemoteDesktopAdmin

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xremotedesktopadmin | [xRemoteDesktopAdmin](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xRemoteDesktopAdmin/DSCResources/xRemoteDesktopAdmin) | [repo](https://github.com/PowerShell/xRemoteDesktopAdmin)

##### xRemoteDesktopSessionHost

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xrdremoteapp | [xRDRemoteApp](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xRemoteDesktopSessionHost/DSCResources/MSFT_xRDRemoteApp) | [repo](https://github.com/PowerShell/xRemoteDesktopSessionHost)
dsc_xrdsessioncollection | [xRDSessionCollection](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xRemoteDesktopSessionHost/DSCResources/MSFT_xRDSessionCollection) | [repo](https://github.com/PowerShell/xRemoteDesktopSessionHost)
dsc_xrdsessioncollectionconfiguration | [xRDSessionCollectionConfiguration](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xRemoteDesktopSessionHost/DSCResources/MSFT_xRDSessionCollectionConfiguration) | [repo](https://github.com/PowerShell/xRemoteDesktopSessionHost)
dsc_xrdsessiondeployment | [xRDSessionDeployment](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xRemoteDesktopSessionHost/DSCResources/MSFT_xRDSessionDeployment) | [repo](https://github.com/PowerShell/xRemoteDesktopSessionHost)

##### xRobocopy

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xrobocopy | [xRobocopy](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xRobocopy/DSCResources/MSFT_xRobocopy) | [repo](https://github.com/PowerShell/xRobocopy)

##### xSCDPM

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xscdpmconsolesetup | [xSCDPMConsoleSetup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCDPM/DSCResources/MSFT_xSCDPMConsoleSetup) | [repo](https://github.com/PowerShell/xSCDPM)
dsc_xscdpmdatabaseserversetup | [xSCDPMDatabaseServerSetup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCDPM/DSCResources/MSFT_xSCDPMDatabaseServerSetup) | [repo](https://github.com/PowerShell/xSCDPM)
dsc_xscdpmserversetup | [xSCDPMServerSetup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCDPM/DSCResources/MSFT_xSCDPMServerSetup) | [repo](https://github.com/PowerShell/xSCDPM)

##### xSCOM

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xscomadmin | [xSCOMAdmin](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCOM/DSCResources/MSFT_xSCOMAdmin) | [repo](https://github.com/PowerShell/xSCOM)
dsc_xscomconsolesetup | [xSCOMConsoleSetup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCOM/DSCResources/MSFT_xSCOMConsoleSetup) | [repo](https://github.com/PowerShell/xSCOM)
dsc_xscomconsoleupdate | [xSCOMConsoleUpdate](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCOM/DSCResources/MSFT_xSCOMConsoleUpdate) | [repo](https://github.com/PowerShell/xSCOM)
dsc_xscommanagementpack | [xSCOMManagementPack](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCOM/DSCResources/MSFT_xSCOMManagementPack) | [repo](https://github.com/PowerShell/xSCOM)
dsc_xscommanagementserversetup | [xSCOMManagementServerSetup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCOM/DSCResources/MSFT_xSCOMManagementServerSetup) | [repo](https://github.com/PowerShell/xSCOM)
dsc_xscommanagementserverupdate | [xSCOMManagementServerUpdate](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCOM/DSCResources/MSFT_xSCOMManagementServerUpdate) | [repo](https://github.com/PowerShell/xSCOM)
dsc_xscomreportingserversetup | [xSCOMReportingServerSetup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCOM/DSCResources/MSFT_xSCOMReportingServerSetup) | [repo](https://github.com/PowerShell/xSCOM)
dsc_xscomwebconsoleserversetup | [xSCOMWebConsoleServerSetup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCOM/DSCResources/MSFT_xSCOMWebConsoleServerSetup) | [repo](https://github.com/PowerShell/xSCOM)
dsc_xscomwebconsoleserverupdate | [xSCOMWebConsoleServerUpdate](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCOM/DSCResources/MSFT_xSCOMWebConsoleServerUpdate) | [repo](https://github.com/PowerShell/xSCOM)

##### xSCSMA

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xscsmapowershellsetup | [xSCSMAPowerShellSetup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCSMA/DSCResources/MSFT_xSCSMAPowerShellSetup) | [repo](https://github.com/PowerShell/xSCSMA)
dsc_xscsmarunbookworkerserversetup | [xSCSMARunbookWorkerServerSetup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCSMA/DSCResources/MSFT_xSCSMARunbookWorkerServerSetup) | [repo](https://github.com/PowerShell/xSCSMA)
dsc_xscsmawebserviceserversetup | [xSCSMAWebServiceServerSetup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCSMA/DSCResources/MSFT_xSCSMAWebServiceServerSetup) | [repo](https://github.com/PowerShell/xSCSMA)

##### xSCSPF

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xscspfserver | [xSCSPFServer](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCSPF/DSCResources/MSFT_xSCSPFServer) | [repo](https://github.com/PowerShell/xSCSPF)
dsc_xscspfserversetup | [xSCSPFServerSetup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCSPF/DSCResources/MSFT_xSCSPFServerSetup) | [repo](https://github.com/PowerShell/xSCSPF)
dsc_xscspfserverupdate | [xSCSPFServerUpdate](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCSPF/DSCResources/MSFT_xSCSPFServerUpdate) | [repo](https://github.com/PowerShell/xSCSPF)
dsc_xscspfsetting | [xSCSPFSetting](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCSPF/DSCResources/MSFT_xSCSPFSetting) | [repo](https://github.com/PowerShell/xSCSPF)
dsc_xscspfstamp | [xSCSPFStamp](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCSPF/DSCResources/MSFT_xSCSPFStamp) | [repo](https://github.com/PowerShell/xSCSPF)

##### xSCSR

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xscsrserversetup | [xSCSRServerSetup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCSR/DSCResources/MSFT_xSCSRServerSetup) | [repo](https://github.com/PowerShell/xSCSR)
dsc_xscsrserverupdate | [xSCSRServerUpdate](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCSR/DSCResources/MSFT_xSCSRServerUpdate) | [repo](https://github.com/PowerShell/xSCSR)

##### xSCVMM

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xscvmmadmin | [xSCVMMAdmin](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCVMM/DSCResources/MSFT_xSCVMMAdmin) | [repo](https://github.com/PowerShell/xSCVMM)
dsc_xscvmmconsolesetup | [xSCVMMConsoleSetup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCVMM/DSCResources/MSFT_xSCVMMConsoleSetup) | [repo](https://github.com/PowerShell/xSCVMM)
dsc_xscvmmconsoleupdate | [xSCVMMConsoleUpdate](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCVMM/DSCResources/MSFT_xSCVMMConsoleUpdate) | [repo](https://github.com/PowerShell/xSCVMM)
dsc_xscvmmmanagementserversetup | [xSCVMMManagementServerSetup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCVMM/DSCResources/MSFT_xSCVMMManagementServerSetup) | [repo](https://github.com/PowerShell/xSCVMM)
dsc_xscvmmmanagementserverupdate | [xSCVMMManagementServerUpdate](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSCVMM/DSCResources/MSFT_xSCVMMManagementServerUpdate) | [repo](https://github.com/PowerShell/xSCVMM)

##### xSQLServer

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xsqlserverfailoverclustersetup | [xSQLServerFailoverClusterSetup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSQLServer/DSCResources/MSFT_xSQLServerFailoverClusterSetup) | [repo](https://github.com/PowerShell/xSQLServer)
dsc_xsqlserverfirewall | [xSQLServerFirewall](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSQLServer/DSCResources/MSFT_xSQLServerFirewall) | [repo](https://github.com/PowerShell/xSQLServer)
dsc_xsqlserverrsconfig | [xSQLServerRSConfig](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSQLServer/DSCResources/MSFT_xSQLServerRSConfig) | [repo](https://github.com/PowerShell/xSQLServer)
dsc_xsqlserverrssecureconnectionlevel | [xSQLServerRSSecureConnectionLevel](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSQLServer/DSCResources/MSFT_xSQLServerRSSecureConnectionLevel) | [repo](https://github.com/PowerShell/xSQLServer)
dsc_xsqlserversetup | [xSQLServerSetup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSQLServer/DSCResources/MSFT_xSQLServerSetup) | [repo](https://github.com/PowerShell/xSQLServer)

##### xSharePoint

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xspbcsserviceapp | [xSPBCSServiceApp](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPBCSServiceApp) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspcacheaccounts | [xSPCacheAccounts](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPCacheAccounts) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspcreatefarm | [xSPCreateFarm](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPCreateFarm) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspdiagnosticloggingsettings | [xSPDiagnosticLoggingSettings](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPDiagnosticLoggingSettings) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspdistributedcacheservice | [xSPDistributedCacheService](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPDistributedCacheService) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspfeature | [xSPFeature](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPFeature) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspinstall | [xSPInstall](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPInstall) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspinstallprereqs | [xSPInstallPrereqs](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPInstallPrereqs) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspjoinfarm | [xSPJoinFarm](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPJoinFarm) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspmanagedaccount | [xSPManagedAccount](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPManagedAccount) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspmanagedmetadataserviceapp | [xSPManagedMetaDataServiceApp](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPManagedMetadataServiceApp) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspmanagedpath | [xSPManagedPath](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPManagedPath) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspsearchserviceapp | [xSPSearchServiceApp](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPSearchServiceApp) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspsecurestoreserviceapp | [xSPSecureStoreServiceApp](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPSecureStoreServiceApp) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspserviceapppool | [xSPServiceAppPool](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPServiceAppPool) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspserviceinstance | [xSPServiceInstance](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPServiceInstance) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspsite | [xSPSite](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPSite) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspstateserviceapp | [xSPStateServiceApp](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPStateServiceApp) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspusageapplication | [xSPUsageApplication](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPUsageApplication) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspuserprofileserviceapp | [xSPUserProfileServiceApp](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPUserProfileServiceApp) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspuserprofilesyncservice | [xSPUserProfileSyncService](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPUserProfileSyncService) | [repo](https://github.com/PowerShell/xSharePoint)
dsc_xspwebapplication | [xSPWebApplication](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPWebApplication) | [repo](https://github.com/PowerShell/xSharePoint)

##### xSmbShare

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xsmbshare | [xSmbShare](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSmbShare/DscResources/MSFT_xSmbShare) | [repo](https://github.com/PowerShell/xSmbShare)

##### xSqlPs

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xsqlhaendpoint | [xSqlHAEndPoint](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSqlPs/DSCResources/MSFT_xSqlHAEndPoint) | [repo](https://github.com/PowerShell/xSqlPs)
dsc_xsqlhagroup | [xSqlHAGroup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSqlPs/DSCResources/MSFT_xSqlHAGroup) | [repo](https://github.com/PowerShell/xSqlPs)
dsc_xsqlhaservice | [xSqlHAService](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSqlPs/DSCResources/MSFT_xSqlHAService) | [repo](https://github.com/PowerShell/xSqlPs)
dsc_xsqlserverinstall | [xSqlServerInstall](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSqlPs/DSCResources/MSFT_xSqlServerInstall) | [repo](https://github.com/PowerShell/xSqlPs)
dsc_xwaitforsqlhagroup | [xWaitForSqlHAGroup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xSqlPs/DSCResources/MSFT_xWaitForSqlHAGroup) | [repo](https://github.com/PowerShell/xSqlPs)

##### xStorage

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xdisk | [xDisk](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xStorage/DSCResources/MSFT_xDisk) | [repo](https://github.com/PowerShell/xStorage)
dsc_xmountimage | [xMountImage](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xStorage/DSCResources/MSFT_xMountImage) | [repo](https://github.com/PowerShell/xStorage)
dsc_xwaitfordisk | [xWaitForDisk](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xStorage/DSCResources/MSFT_xWaitForDisk) | [repo](https://github.com/PowerShell/xStorage)

##### xTimeZone

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xtimezone | [xTimeZone](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xTimeZone/DSCResources/xTimeZone) | [repo](https://github.com/PowerShell/xTimeZone)

##### xWebAdministration

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xiishandler | [xIisHandler](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWebAdministration/DSCResources/MSFT_xIIsHandler) | [repo](https://github.com/PowerShell/xWebAdministration)
dsc_xiisfeaturedelegation | [xIisFeatureDelegation](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWebAdministration/DSCResources/MSFT_xIisFeatureDelegation) | [repo](https://github.com/PowerShell/xWebAdministration)
dsc_xiismimetypemapping | [xIisMimeTypeMapping](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWebAdministration/DSCResources/MSFT_xIisMimeTypeMapping) | [repo](https://github.com/PowerShell/xWebAdministration)
dsc_xiismodule | [xIisModule](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWebAdministration/DSCResources/MSFT_xIisModule) | [repo](https://github.com/PowerShell/xWebAdministration)
dsc_xwebapppool | [xWebAppPool](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWebAdministration/DSCResources/MSFT_xWebAppPool) | [repo](https://github.com/PowerShell/xWebAdministration)
dsc_xwebapppooldefaults | [xWebAppPoolDefaults](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWebAdministration/DSCResources/MSFT_xWebAppPoolDefaults) | [repo](https://github.com/PowerShell/xWebAdministration)
dsc_xwebapplication | [xWebApplication](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWebAdministration/DSCResources/MSFT_xWebApplication) | [repo](https://github.com/PowerShell/xWebAdministration)
dsc_xwebconfigkeyvalue | [xWebConfigKeyValue](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWebAdministration/DSCResources/MSFT_xWebConfigKeyValue) | [repo](https://github.com/PowerShell/xWebAdministration)
dsc_xwebsitedefaults | [xWebSiteDefaults](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWebAdministration/DSCResources/MSFT_xWebSiteDefaults) | [repo](https://github.com/PowerShell/xWebAdministration)
dsc_xwebvirtualdirectory | [xWebVirtualDirectory](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWebAdministration/DSCResources/MSFT_xWebVirtualDirectory) | [repo](https://github.com/PowerShell/xWebAdministration)
dsc_xwebsite | [xWebsite](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWebAdministration/DSCResources/MSFT_xWebsite) | [repo](https://github.com/PowerShell/xWebAdministration)

##### xWebDeploy

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xwebpackagedeploy | [xWebPackageDeploy](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWebDeploy/DSCResources/xWebPackageDeploy) | [repo](https://github.com/PowerShell/xWebDeploy)

##### xWinEventLog

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xwineventlog | [xWinEventLog](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWinEventLog/DSCResources/MSFT_xWinEventLog) | [repo](https://github.com/PowerShell/xWinEventLog)

##### xWindowsEventForwarding

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xwefcollector | [xWEFCollector](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWindowsEventForwarding/DSCResources/MSFT_xWEFCollector) | [repo](https://github.com/PowerShell/xWindowsEventForwarding)
dsc_xwefsubscription | [xWEFSubscription](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWindowsEventForwarding/DSCResources/MSFT_xWEFSubscription) | [repo](https://github.com/PowerShell/xWindowsEventForwarding)

##### xWindowsRestore

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xsystemrestore | [xSystemRestore](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWindowsRestore/DSCResources/xSystemRestore) | [repo](https://github.com/PowerShell/xWindowsRestore)
dsc_xsystemrestorepoint | [xSystemRestorePoint](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWindowsRestore/DSCResources/xSystemRestorePoint) | [repo](https://github.com/PowerShell/xWindowsRestore)

##### xWindowsUpdate

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xmicrosoftupdate | [xMicrosoftUpdate](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWindowsUpdate/DscResources/MSFT_xMicrosoftUpdate) | [repo](https://github.com/PowerShell/xWindowsUpdate)
dsc_xhotfix | [xHotfix](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWindowsUpdate/DscResources/MSFT_xWindowsUpdate) | [repo](https://github.com/PowerShell/xWindowsUpdate)

##### xWordPress

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xwordpresssite | [xWordPressSite](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xWordPress/DscResources/MSFT_xWordPressSite) | [repo](https://github.com/PowerShell/xWordPress)


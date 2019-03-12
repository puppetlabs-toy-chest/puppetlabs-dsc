@{

# Script module or binary module file associated with this manifest.
RootModule = 'WmiNamespaceSecurity.psm1'

# Version number of this module.
ModuleVersion = '0.3.0'

# ID used to uniquely identify this module
GUID = 'f41512fb-2661-4741-83bd-683b11013557'

# Author of this module
Author = 'Steve Lee'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = '(c) 2015 Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'DSC resource provider and cmdlets for managing WMI namespace security'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.0'

# Required for DSC to detect PS class-based resources.
DscResourcesToExport =  @('WMINamespaceSecurity')

}

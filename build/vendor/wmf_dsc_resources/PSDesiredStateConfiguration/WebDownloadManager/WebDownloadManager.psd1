#
# Module manifest for module 'PowerShellDSC'
#
# Copyright="© Microsoft Corporation. All rights reserved."
#

@{

RootModule = 'Microsoft.Windows.DSC.CoreConfProviders.dll'

ModuleVersion = '1.0'

GUID = 'adbe5088-8b42-4858-b1f0-25fac659bbd2'

Author = 'Microsoft'

CompanyName = 'Microsoft'

Copyright="© Microsoft Corporation. All rights reserved."

Description = 'Module that implements the DSC Web Download Manager'

# PowerShellVersion = ''

# PowerShellHostName = ''

# PowerShellHostVersion = ''

# DotNetFrameworkVersion = ''

# CLRVersion = ''

# Processor architecture (None, X86, Amd64)
# ProcessorArchitecture = ''

# RequiredModules = @()

RequiredAssemblies = @("Microsoft.Management.Infrastructure")

# TypesToProcess = @()

# FormatsToProcess = @()

CmdletsToExport = @('Get-DscDocument',
                      'Get-DscModule',
                      'Get-DscAction',
                      'Send-DscStatus')

VariablesToExport = '*'

AliasesToExport = '*'

# ModuleList = @()

# FileList = @()

# PrivateData = ''

#HelpInfoURI = 'http://go.microsoft.com/fwlink/?LinkId=280237'

# DefaultCommandPrefix = ''

}


function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $AuthenticationSite,

        [parameter(Mandatory = $true)]
        [System.String]
        $AdminUri,

        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $AzurePackAdminCredential,

        [System.String]
        $DisplayName,

        [System.Boolean]
        $Enabled = $true,

        [System.Boolean]
        $PassthroughEnabled,

        [System.Boolean]
        $AllowAnonymousAccess,

        [System.Boolean]
        $AllowMultipleInstances,

        [System.String]
        $AdminForwardingAddress,

        [System.String]
        [ValidateSet("None","Basic","Windows")]
        $AdminAuthenticationMode,

        [System.Management.Automation.PSCredential]
        $AdminAuthenticationUser,

        [System.String]
        $TenantForwardingAddress,

        [System.String]
        [ValidateSet("None","Basic","Windows")]
        $TenantAuthenticationMode,

        [System.Management.Automation.PSCredential]
        $TenantAuthenticationUser,

        [System.String]
        $TenantSourceUriTemplate,

        [System.String]
        $TenantTargetUriTemplate,

        [System.String]
        $UsageForwardingAddress,

        [System.String]
        [ValidateSet("None","Basic","Windows")]
        $UsageAuthenticationMode,

        [System.Management.Automation.PSCredential]
        $UsageAuthenticationUser,

        [System.String]
        $HealthCheckForwardingAddress,

        [System.String]
        [ValidateSet("None","Basic","Windows")]
        $HealthCheckAuthenticationMode,

        [System.Management.Automation.PSCredential]
        $HealthCheckAuthenticationUser,

        [System.String]
        $NotificationForwardingAddress,

        [System.String]
        [ValidateSet("None","Basic","Windows")]
        $NotificationAuthenticationMode,

        [System.Management.Automation.PSCredential]
        $NotificationAuthenticationUser,

        [System.String]
        $InstanceId,

        [System.String]
        $InstanceDisplayName,

        [System.String]
        $MaxQuotaUpdateBatchSize,

        [System.String]
        $SubscriptionStatusPollingInterval,

        [System.String]
        [ValidateSet("Standard","UsageProvider","CloudServiceProvider")]
        $Type
    )

    $RP = Invoke-Command -ComputerName . -Credential $AzurePackAdminCredential -Authentication Credssp {
        $AuthenticationSite = $args[0]
        $AdminUri = $args[1]
        $Name = $args[2]
        $RP = Get-MgmtSvcResourceProviderConfiguration -Name $Name;
        @{
            AuthenticationSite = $AuthenticationSite
            AdminUri = $AdminUri
            Name = $Name
            DisplayName = $RP.DisplayName
            Enabled = $RP.Enabled
            PassthroughEnabled = $RP.PassthroughEnabled
            AllowAnonymousAccess = $RP.AllowAnonymousAccess
            AllowMultipleInstances = $RP.AllowMultipleInstances
            AdminForwardingAddress = $RP.AdminEndpoint.ForwardingAddress.AbsoluteUri
            AdminAuthenticationMode = $RP.AdminEndpoint.AuthenticationMode
            AdminAuthenticationUsername = $RP.AdminEndpoint.AuthenticationUsername
            TenantForwardingAddress = $RP.TenantEndpoint.ForwardingAddress.AbsoluteUri
            TenantAuthenticationMode = $RP.TenantEndpoint.AuthenticationMode
            TenantAuthenticationUsername = $RP.TenantEndpoint.AuthenticationUsername
            TenantSourceUriTemplate = $RP.TenantEndpoint.SourceUriTemplate
            TenantTargetUriTemplate = $RP.TenantEndpoint.TargetUriTemplate
            UsageForwardingAddress = $RP.UsageEndpoint.ForwardingAddress.AbsoluteUri
            UsageAuthenticationMode = $RP.UsageEndpoint.AuthenticationMode
            UsageAuthenticationUsername = $RP.UsageEndpoint.AuthenticationUsername
            HealthCheckForwardingAddress = $RP.HealthCheckEndpoint.ForwardingAddress.AbsoluteUri
            HealthCheckAuthenticationMode = $RP.HealthCheckEndpoint.AuthenticationMode
            HealthCheckAuthenticationUsername = $RP.HealthCheckEndpoint.AuthenticationUsername
            NotificationForwardingAddress = $RP.NotificationEndpoint.ForwardingAddress.AbsoluteUri
            NotificationAuthenticationMode = $RP.NotificationEndpoint.AuthenticationMode
            NotificationAuthenticationUsername = $RP.NotificationEndpoint.AuthenticationUsername
            InstanceId = $RP.InstanceId
            InstanceDisplayName = $RP.InstanceDisplayName
            MaxQuotaUpdateBatchSize = $RP.MaxQuotaUpdateBatchSize
            SubscriptionStatusPollingInterval = $RP.SubscriptionStatusPollingInterval
            Type = $RP.Type
        }
    } -ArgumentList @($AuthenticationSite,$AdminUri,$Name)

    $returnValue = $RP

    $returnValue
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $AuthenticationSite,

        [parameter(Mandatory = $true)]
        [System.String]
        $AdminUri,

        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $AzurePackAdminCredential,

        [System.String]
        $DisplayName,

        [System.Boolean]
        $Enabled = $true,

        [System.Boolean]
        $PassthroughEnabled,

        [System.Boolean]
        $AllowAnonymousAccess,

        [System.Boolean]
        $AllowMultipleInstances,

        [System.String]
        $AdminForwardingAddress,

        [System.String]
        [ValidateSet("None","Basic","Windows")]
        $AdminAuthenticationMode,

        [System.Management.Automation.PSCredential]
        $AdminAuthenticationUser,

        [System.String]
        $TenantForwardingAddress,

        [System.String]
        [ValidateSet("None","Basic","Windows")]
        $TenantAuthenticationMode,

        [System.Management.Automation.PSCredential]
        $TenantAuthenticationUser,

        [System.String]
        $TenantSourceUriTemplate,

        [System.String]
        $TenantTargetUriTemplate,

        [System.String]
        $UsageForwardingAddress,

        [System.String]
        [ValidateSet("None","Basic","Windows")]
        $UsageAuthenticationMode,

        [System.Management.Automation.PSCredential]
        $UsageAuthenticationUser,

        [System.String]
        $HealthCheckForwardingAddress,

        [System.String]
        [ValidateSet("None","Basic","Windows")]
        $HealthCheckAuthenticationMode,

        [System.Management.Automation.PSCredential]
        $HealthCheckAuthenticationUser,

        [System.String]
        $NotificationForwardingAddress,

        [System.String]
        [ValidateSet("None","Basic","Windows")]
        $NotificationAuthenticationMode,

        [System.Management.Automation.PSCredential]
        $NotificationAuthenticationUser,

        [System.String]
        $InstanceId,

        [System.String]
        $InstanceDisplayName,

        [System.String]
        $MaxQuotaUpdateBatchSize,

        [System.String]
        $SubscriptionStatusPollingInterval,

        [System.String]
        [ValidateSet("Standard","UsageProvider","CloudServiceProvider")]
        $Type
    )

    Invoke-Command -ComputerName . -Credential $AzurePackAdminCredential -Authentication Credssp {
        $AuthenticationSite = $args[0]
        $AdminUri = $args[1]
        $Name = $args[2]
        $AzurePackAdminCredential = $args[3]
        $DisplayName = $args[4]
        $Enabled = $args[5]
        $PassthroughEnabled = $args[6]
        $AllowAnonymousAccess = $args[7]
        $AllowMultipleInstances = $args[8]
        $AdminForwardingAddress = $args[9]
        $AdminAuthenticationMode = $args[10]
        $AdminAuthenticationUser = $args[11]
        $TenantForwardingAddress = $args[12]
        $TenantAuthenticationMode = $args[13]
        $TenantAuthenticationUser = $args[14]
        $TenantSourceUriTemplate = $args[15]
        $TenantTargetUriTemplate = $args[16]
        $UsageForwardingAddress = $args[17]
        $UsageAuthenticationMode = $args[18]
        $UsageAuthenticationUser = $args[19]
        $HealthCheckForwardingAddress = $args[20]
        $HealthCheckAuthenticationMode = $args[21]
        $HealthCheckAuthenticationUser = $args[22]
        $NotificationForwardingAddress = $args[23]
        $NotificationAuthenticationMode = $args[24]
        $NotificationAuthenticationUser = $args[25]
        $InstanceId = $args[26]
        $InstanceDisplayName = $args[27]
        $MaxQuotaUpdateBatchSize = $args[28]
        $SubscriptionStatusPollingInterval = $args[29]
        $Type = $args[30]

        Import-Module -Name MgmtSvcConfig

        $TokenTry = 0
        While (!($Token) -and ($TokenTry -lt 5)) {
            $Token = Get-MgmtSvcToken -Type Windows -AuthenticationSite $AuthenticationSite -ClientRealm 'http://azureservices/AdminSite' -User $AzurePackAdminCredential -DisableCertificateValidation
            If (!($Token)) {
                Start-Sleep 5
                $TokenTry++
            }
        }

        if($Token)
        {
            if(Get-MgmtSvcResourceProviderConfiguration -Name $Name)
            {
                $RP = Get-MgmtSvcResourceProviderConfiguration -Name $Name
                $Vars = @(
                    "DisplayName",
                    "Enabled",
                    "PassthroughEnabled",
                    "AllowAnonymousAccess",
                    "AllowMultipleInstances",
                    "AdminForwardingAddress",
                    "AdminAuthenticationMode",
                    "AdminAuthenticationUser",
                    "TenantForwardingAddress",
                    "TenantAuthenticationMode",
                    "TenantAuthenticationUser",
                    "TenantSourceUriTemplate",
                    "TenantTargetUriTemplate",
                    "UsageForwardingAddress",
                    "UsageAuthenticationMode",
                    "UsageAuthenticationUser",
                    "HealthCheckForwardingAddress",
                    "HealthCheckAuthenticationMode",
                    "HealthCheckAuthenticationUser",
                    "NotificationForwardingAddress",
                    "NotificationAuthenticationMode",
                    "NotificationAuthenticationUser",
                    "InstanceId",
                    "InstanceDisplayName",
                    "MaxQuotaUpdateBatchSize",
                    "SubscriptionStatusPollingInterval",
                    "Type"
                )
                foreach($Var in $Vars)
                {
                    if(!([String]::IsNullOrEmpty((Get-Variable -Name $Var).Value)))
                    {
                        if(
                            (($Var.Contains("User")) -and ((Get-Variable -Name $Var).Value.Username -ne $RP.($Var + "name"))) -or
                            (!($Var.Contains("User")) -and ((Get-Variable -Name $Var).Value -ne $RP.$Var))
                        )
                        {
                            switch($Var)
                            {
                                "AdminForwardingAddress"
                                {
                                    $RP.AdminEndpoint.ForwardingAddress = (Get-Variable -Name $Var).Value
                                }
                                "AdminAuthenticationMode"
                                {
                                    $RP.AdminEndpoint.AuthenticationMode = (Get-Variable -Name $Var).Value
                                }
                                "AdminAuthenticationUser"
                                {
                                    $RP.AdminEndpoint.AuthenticationUsername = (Get-Variable -Name $Var).Value.Username
                                    $RP.AdminEndpoint.AuthenticationPassword = (Get-Variable -Name $Var).Value.GetNetworkCredential().Password
                                }
                                "TenantForwardingAddress"
                                {
                                    $RP.TenantEndpoint.ForwardingAddress = (Get-Variable -Name $Var).Value
                                }
                                "TenantAuthenticationMode"
                                {
                                    $RP.TenantEndpoint.AuthenticationMode = (Get-Variable -Name $Var).Value
                                }
                                "TenantAuthenticationUser"
                                {
                                    $RP.TenantEndpoint.AuthenticationUsername = (Get-Variable -Name $Var).Value.Username
                                    $RP.AdminEndpoint.AuthenticationPassword = (Get-Variable -Name $Var).Value.GetNetworkCredential().Password
                                }
                                "TenantSourceUriTemplate"
                                {
                                    $RP.TenantEndpoint.SourceUriTemplate = (Get-Variable -Name $Var).Value
                                }
                                "TenantTargetUriTemplate"
                                {
                                    $RP.TenantEndpoint.TargetUriTemplate = (Get-Variable -Name $Var).Value
                                }
                                "UsageForwardingAddress"
                                {
                                    $RP.UsageEndpoint.ForwardingAddress = (Get-Variable -Name $Var).Value
                                }
                                "UsageAuthenticationMode"
                                {
                                    $RP.UsageEndpoint.AuthenticationMode = (Get-Variable -Name $Var).Value
                                }
                                "UsageAuthenticationUser"
                                {
                                    $RP.UsageEndpoint.AuthenticationUsername = (Get-Variable -Name $Var).Value.Username
                                    $RP.AdminEndpoint.AuthenticationPassword = (Get-Variable -Name $Var).Value.GetNetworkCredential().Password
                                }
                                "HealthCheckForwardingAddress"
                                {
                                    $RP.HealthCheckEndpoint.ForwardingAddress = (Get-Variable -Name $Var).Value
                                }
                                "HealthCheckAuthenticationMode"
                                {
                                    $RP.HealthCheckEndpoint.AuthenticationMode = (Get-Variable -Name $Var).Value
                                }
                                "HealthCheckAuthenticationUser"
                                {
                                    $RP.HealthCheckEndpoint.AuthenticationUsername = (Get-Variable -Name $Var).Value.Username
                                    $RP.HealthCheckEndpoint.AuthenticationPassword = (Get-Variable -Name $Var).Value.GetNetworkCredential().Password
                                }
                                "NotificationForwardingAddress"
                                {
                                    $RP.NotificationEndpoint.ForwardingAddress = (Get-Variable -Name $Var).Value
                                }
                                "NotificationAuthenticationMode"
                                {
                                    $RP.NotificationEndpoint.AuthenticationMode = (Get-Variable -Name $Var).Value
                                }
                                "NotificationAuthenticationUser"
                                {
                                    $RP.NotificationEndpoint.AuthenticationUsername = (Get-Variable -Name $Var).Value.Username
                                    $RP.NotificationEndpoint.AuthenticationPassword = (Get-Variable -Name $Var).Value.GetNetworkCredential().Password
                                }
                                "SubscriptionStatusPollingInterval"
                                {
                                    $RP.NotificationEndpoint.AuthenticationUsername = New-TimeSpan -Seconds ((Get-Variable -Name $Var).Value)
                                }

                                Default
                                {
                                    $RP.$Var = (Get-Variable -Name $Var).Value
                                }
                            }
                        }
                    }
                }
                Set-MgmtSvcResourceProvider -AdminUri $AdminUri -Token $Token -ResourceProvider $RP -DisableCertificateValidation -Confirm:$false
            }
            else
            {
                $RPParams = @{}
                $Vars = @(
                    "Name",
                    "DisplayName",
                    "AdminForwardingAddress",
                    "AdminAuthenticationMode",
                    "AdminAuthenticationUser",
                    "TenantForwardingAddress",
                    "TenantAuthenticationMode",
                    "TenantAuthenticationUser",
                    "TenantSourceUriTemplate",
                    "TenantTargetUriTemplate",
                    "UsageForwardingAddress",
                    "UsageAuthenticationMode",
                    "UsageAuthenticationUser",
                    "HealthCheckForwardingAddress",
                    "HealthCheckAuthenticationMode",
                    "HealthCheckAuthenticationUser",
                    "NotificationForwardingAddress",
                    "NotificationAuthenticationMode",
                    "NotificationAuthenticationUser",
                    "InstanceId",
                    "InstanceDisplayName",
                    "MaxQuotaUpdateBatchSize",
                    "SubscriptionStatusPollingInterval",
                    "Type"
                )
                foreach($Var in $Vars)
                {
                    if(!([String]::IsNullOrEmpty((Get-Variable -Name $Var).Value)))
                    {
                        if($Var.Contains("User"))
                        {
                            $RPParams.Add(($Var + "name"),(Get-Variable -Name $Var).Value.UserName)
                            $RPParams.Add(($Var.Replace("User","Password")),(Get-Variable -Name $Var).Value.GetNetworkCredential().Password)
                        }
                        else
                        {
                            $RPParams.Add($Var,(Get-Variable -Name $Var).Value)
                        }
                    }
                }
                $RP = New-MgmtSvcResourceProviderConfiguration @RPParams
                $Vars = @(
                    "Enabled",
                    "PassthroughEnabled",
                    "AllowAnonymousAccess",
                    "AllowMultipleInstances"
                )
                foreach($Var in $Vars)
                {
                    if(!([String]::IsNullOrEmpty((Get-Variable -Name $Var).Value)))
                    {
                        $RP.$Var = (Get-Variable -Name $Var).Value
                    }
                }
                Add-MgmtSvcResourceProvider -AdminUri $AdminUri -Token $Token -ResourceProvider $RP -DisableCertificateValidation -Confirm:$false
            }
        } 
    } -ArgumentList @($AuthenticationSite,$AdminUri,$Name,$AzurePackAdminCredential,$DisplayName,$Enabled,$PassthroughEnabled,$AllowAnonymousAccess,$AllowMultipleInstances,$AdminForwardingAddress,$AdminAuthenticationMode,$AdminAuthenticationUser,$TenantForwardingAddress,$TenantAuthenticationMode,$TenantAuthenticationUser,$TenantSourceUriTemplate,$TenantTargetUriTemplate,$UsageForwardingAddress,$UsageAuthenticationMode,$UsageAuthenticationUser,$HealthCheckForwardingAddress,$HealthCheckAuthenticationMode,$HealthCheckAuthenticationUser,$NotificationForwardingAddress,$NotificationAuthenticationMode,$NotificationAuthenticationUser,$InstanceId,$InstanceDisplayName,$MaxQuotaUpdateBatchSize,$SubscriptionStatusPollingInterval,$Type)

    if(!(Test-TargetResource @PSBoundParameters))
    {
        throw "Set-TargetResouce failed"
    }
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $AuthenticationSite,

        [parameter(Mandatory = $true)]
        [System.String]
        $AdminUri,

        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $AzurePackAdminCredential,

        [System.String]
        $DisplayName,

        [System.Boolean]
        $Enabled = $true,

        [System.Boolean]
        $PassthroughEnabled,

        [System.Boolean]
        $AllowAnonymousAccess,

        [System.Boolean]
        $AllowMultipleInstances,

        [System.String]
        $AdminForwardingAddress,

        [System.String]
        [ValidateSet("None","Basic","Windows")]
        $AdminAuthenticationMode,

        [System.Management.Automation.PSCredential]
        $AdminAuthenticationUser,

        [System.String]
        $TenantForwardingAddress,

        [System.String]
        [ValidateSet("None","Basic","Windows")]
        $TenantAuthenticationMode,

        [System.Management.Automation.PSCredential]
        $TenantAuthenticationUser,

        [System.String]
        $TenantSourceUriTemplate,

        [System.String]
        $TenantTargetUriTemplate,

        [System.String]
        $UsageForwardingAddress,

        [System.String]
        [ValidateSet("None","Basic","Windows")]
        $UsageAuthenticationMode,

        [System.Management.Automation.PSCredential]
        $UsageAuthenticationUser,

        [System.String]
        $HealthCheckForwardingAddress,

        [System.String]
        [ValidateSet("None","Basic","Windows")]
        $HealthCheckAuthenticationMode,

        [System.Management.Automation.PSCredential]
        $HealthCheckAuthenticationUser,

        [System.String]
        $NotificationForwardingAddress,

        [System.String]
        [ValidateSet("None","Basic","Windows")]
        $NotificationAuthenticationMode,

        [System.Management.Automation.PSCredential]
        $NotificationAuthenticationUser,

        [System.String]
        $InstanceId,

        [System.String]
        $InstanceDisplayName,

        [System.String]
        $MaxQuotaUpdateBatchSize,

        [System.String]
        $SubscriptionStatusPollingInterval,

        [System.String]
        [ValidateSet("Standard","UsageProvider","CloudServiceProvider")]
        $Type
    )

    $RP = Get-TargetResource @PSBoundParameters
    
    if($RP.InstanceId)
    {
        $result = $true

        $Vars = @(
            "DisplayName",
            "Enabled",
            "PassthroughEnabled",
            "AllowAnonymousAccess",
            "AllowMultipleInstances",
            "AdminForwardingAddress",
            "AdminAuthenticationMode",
            "TenantForwardingAddress",
            "TenantAuthenticationMode",
            "TenantSourceUriTemplate",
            "TenantTargetUriTemplate",
            "UsageForwardingAddress",
            "UsageAuthenticationMode",
            "HealthCheckForwardingAddress",
            "HealthCheckAuthenticationMode",
            "NotificationForwardingAddress",
            "NotificationAuthenticationMode",
            "InstanceId",
            "InstanceDisplayName",
            "MaxQuotaUpdateBatchSize",
            "SubscriptionStatusPollingInterval",
            "Type"
        )
        foreach($Var in $Vars)
        {
            if($result -and !([String]::IsNullOrEmpty((Get-Variable -Name $Var).Value)))
            {
                if($Var.Contains("AuthenticationMode") -or ($Var -eq "Type") -or ($Var -eq "SubscriptionStatusPollingInterval"))
                {
                    if($Var -eq "SubscriptionStatusPollingInterval")
                    {
                        if((New-TimeSpan -Seconds ((Get-Variable -Name $Var).Value)) -ne $RP.$Var)
                        {
                            Write-Verbose ("$Var is " + $RP.$Var + " and should be " + ((Get-Variable -Name $Var).Value))
                            $result = $false                            
                        }   
                    }
                    else
                    {
                        switch((Get-Variable -Name $Var).Value)
                        {
                            "None"
                            {
                                if(((Get-Variable -Name $Var).Value -ne $RP.$Var) -and (0 -ne $RP.$Var))
                                {
                                    Write-Verbose ("$Var is " + $RP.$Var + " and should be " + ((Get-Variable -Name $Var).Value))
                                    $result = $false
                                }
                            }
                            "Basic"
                            {
                                if(((Get-Variable -Name $Var).Value -ne $RP.$Var) -and (1 -ne $RP.$Var))
                                {
                                    Write-Verbose ("$Var is " + $RP.$Var + " and should be " + ((Get-Variable -Name $Var).Value))
                                    $result = $false
                                }
                            }
                            "Windows"
                            {
                                if(((Get-Variable -Name $Var).Value -ne $RP.$Var) -and (2 -ne $RP.$Var))
                                {
                                    Write-Verbose ("$Var is " + $RP.$Var + " and should be " + ((Get-Variable -Name $Var).Value))
                                    $result = $false
                                }
                            }
                            "Standard"
                            {
                                if(((Get-Variable -Name $Var).Value -ne $RP.$Var) -and (0 -ne $RP.$Var))
                                {
                                    Write-Verbose ("$Var is " + $RP.$Var + " and should be " + ((Get-Variable -Name $Var).Value))
                                    $result = $false
                                }
                            }
                            "UsageProvider"
                            {
                                if(((Get-Variable -Name $Var).Value -ne $RP.$Var) -and (1 -ne $RP.$Var))
                                {
                                    Write-Verbose ("$Var is " + $RP.$Var + " and should be " + ((Get-Variable -Name $Var).Value))
                                    $result = $false
                                }
                            }
                            "CloudServiceProvider"
                            {
                                if(((Get-Variable -Name $Var).Value -ne $RP.$Var) -and (2 -ne $RP.$Var))
                                {
                                    Write-Verbose ("$Var is " + $RP.$Var + " and should be " + ((Get-Variable -Name $Var).Value))
                                    $result = $false
                                }
                            }
                        }
                    }
                }
                else
                {
                    if((Get-Variable -Name $Var).Value -ne $RP.$Var)
                    {
                        Write-Verbose ("$Var is " + $RP.$Var + " and should be " + ((Get-Variable -Name $Var).Value))
                        $result = $false
                    }
                }
            }
        }

        if($result)
        {
            $Vars = @(
                "NotificationAuthenticationUser",
                "AdminAuthenticationUser",
                "TenantAuthenticationUser",
                "UsageAuthenticationUser",
                "HealthCheckAuthenticationUser"
            )
            foreach($Var in $Vars)
            {
                if($result -and !([String]::IsNullOrEmpty((Get-Variable -Name $Var).Value)))
                {
                    if((Get-Variable -Name $Var).Value.UserName -ne $RP.($Var + "name"))
                    {
                        Write-Verbose ("$Var is " + $RP.($Var + "name") + " and should be " + ((Get-Variable -Name $Var).Value.UserName))
                        $result = $false
                    }
                }
            }
        }
    }
    else
    {
        Write-Verbose "Resource provider $name does not exist"
        $result = $false
    }

    $result
}


Export-ModuleMember -Function *-TargetResource
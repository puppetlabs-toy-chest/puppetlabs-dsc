function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $RuleName,

        [parameter(Mandatory = $true)]
        [System.String]
        $ServerName,

        [parameter(Mandatory = $true)]
        [System.String]
        $StartIPAddress,

        [parameter(Mandatory = $true)]
        [System.String]
        $EndIPAddress,

        [System.String]
        $AzureSubscriptionName,

        [System.String]
        $AzurePublishSettingsFile
    )

    # Select Azure subscription
    if ($AzureSubscriptionName -and $AzurePublishSettingsFile)
    {
        Write-Verbose "Azure Publish Setting provided. AzureSubscriptionName = $AzureSubscriptionName,  AzurePublishSettingsFile = $AzurePublishSettingsFile. Selecting Azure subscription."
        Import-AzurePublishSettingsFile $AzurePublishSettingsFile -verbose
        Select-AzureSubscription -SubscriptionName $AzureSubscriptionName -Current -ErrorAction SilentlyContinue -verbose
        $currentSubscription = Get-AzureSubscription -Current -verbose
        Write-Verbose "The selected Azure subscription ID is $($currentSubscription.SubscriptionID)"
    }

    $startIPAddressState = $null
    $endIPAddressState = $null
    $ensureState = $null

    # Get firewall rule state
    Write-Verbose "Getting status of firewall rule '$RuleName'"
    $currentFirewallRule = Get-AzureSqlDatabaseServerFirewallRule -ServerName $ServerName -RuleName $RuleName -ErrorAction SilentlyContinue -verbose
    Write-Verbose "Status of firewall rule '$RuleName' obtained."
    if ($currentFirewallRule) {
        $startIPAddressState = $currentFirewallRule.StartIPAddress
        $endIPAddressState = $currentFirewallRule.EndIPAddress
        $ensureState = "Present"
    } else {
        $ensureState = "Absent"
    }

    $returnValue = @{
        RuleName = $RuleName
        ServerName = $ServerName
        StartIPAddress = $startIPAddressState
        EndIPAddress = $endIPAddressState
        AzureSubscriptionName = $AzureSubscriptionName
        AzurePublishSettingsFile = $AzurePublishSettingsFile
        Ensure = $ensureState
    }

    $returnValue
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $RuleName,

        [parameter(Mandatory = $true)]
        [System.String]
        $ServerName,

        [parameter(Mandatory = $true)]
        [System.String]
        $StartIPAddress,

        [parameter(Mandatory = $true)]
        [System.String]
        $EndIPAddress,

        [System.String]
        $AzureSubscriptionName,

        [System.String]
        $AzurePublishSettingsFile,

        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = "Present"
    )

    # Check whether firwall rule with specific name exists
    $PSBoundParameters.Remove("Ensure") | Out-Null
    $currentFirewallRule = Get-TargetResource @PSBoundParameters
    $firwallRuleExists = $false
    if ($currentFirewallRule.Ensure -eq "Present") {
        $firewallRuleExists = $true
    }
    
    # If we want to ensure firewall rule is present
    if ($Ensure -eq "Present")
    {
        # Create firewall rule if not exists
        if (-not $firewallRuleExists) {
            Write-Verbose "Creating firewall rule '$RuleName'"
            New-AzureSqlDatabaseServerFirewallRule -ServerName $ServerName -RuleName $RuleName -StartIpAddress $StartIPAddress -EndIpAddress $EndIPAddress -ErrorAction Stop | Out-Null
            Write-Verbose "Firewall rule '$RuleName' created"
        # Modify firewall rule if exists
        } else {
            Write-Verbose "Updating firewall rule '$RuleName'"
            Set-AzureSqlDatabaseServerFirewallRule -ServerName $ServerName -RuleName $RuleName -StartIpAddress $StartIPAddress -EndIpAddress $EndIPAddress -ErrorAction Stop | Out-Null
            Write-Verbose "Firewall rule '$RuleName' updated"
        }
    }
    # If we want to ensure database is absent
    elseif ($Ensure -eq "Absent")
    {
        # Remove firewall rule
        if ($firewallRuleExists) {
            Write-Verbose "Firewall rule '$RuleName' exists. Removing it."
            Remove-AzureSqlDatabaseServerFirewallRule -ServerName $ServerName -RuleName $RuleName -verbose
            Write-Verbose "Firewall rule '$RuleName' has been removed."
        } else {
            Write-Verbose "Firewall rule '$RuleName' does not exist. No need to remove."
        }
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
        $RuleName,

        [parameter(Mandatory = $true)]
        [System.String]
        $ServerName,

        [parameter(Mandatory = $true)]
        [System.String]
        $StartIPAddress,

        [parameter(Mandatory = $true)]
        [System.String]
        $EndIPAddress,

        [System.String]
        $AzureSubscriptionName,

        [System.String]
        $AzurePublishSettingsFile,

        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = "Present"
    )

    $testResult = $true;

    $PSBoundParameters.Remove("Ensure") | Out-Null
    $currentFirewallRule = Get-TargetResource @PSBoundParameters
    Write-Verbose "Testing whether resource is in desired state"
    if($Ensure -eq "Present") {
        if ($currentFirewallRule.Ensure -eq "Present") {
            
            # Check whether current firewall rule properties match the specified ones
            if($currentFirewallRule.StartIpAddress.Equals($startIPAddress) -and $currentFirewallRule.EndIpAddress.Equals($endIPAddress)) {
                Write-Verbose "SQL database server firewall rule '$RuleName' exists and properties match. Resource is in desired state."
            } else {
                Write-Verbose "SQL database server firewall rule '$RuleName' exists but properties don't match. Resource is not in desired state."
                $testResult = $false
            }
        } else {
            Write-Verbose "SQL database server firewall rule '$RuleName' does not exist, but expected to be present. Resource is not in desired state."
            $testResult = $false
        }
    } elseif ($Ensure -eq "Absent") {
        
        # If firewall rule with given name exists, resource is not in the desired state
        if ($currentFirewallRule.Ensure -eq "Present") {
            Write-Verbose "SQL database server firewall rule '$RuleName' exists, but expected to be absent. Resource is not in desired state."
            $testResult = $false
        } else {
            Write-Verbose "SQL database server firewall rule '$RuleName' does not exist. Resource is in desired state."
        }
    }

    $testResult

}


Export-ModuleMember -Function *-TargetResource




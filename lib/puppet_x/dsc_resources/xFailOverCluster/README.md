[![Build status](https://ci.appveyor.com/api/projects/status/6a59vfritv4kbc7d/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xfailovercluster/branch/master)

# xFailOverCluster

The **xFailOverCluster** DSC modules contains **xCluster** and **xWaitForCluster** resources for creating and configuring failover clusters. 

## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).


## Resources

* **xCluster** ensures that a group of machines form a cluster.
* **xWaitForCluster** ensures that a node waits for a remote cluster is created.

### xCluster

* **Name**: Name of the cluster
* **StaticIPAddress**: Static IP Address of the cluster
* **DomainAdministratorCredential**: Credential used to create the cluster

### xWaitForCluster

* **Name**: Name of the cluster to wait for
* **RetryIntervalSec**: Interval to check for cluster existence
* **RetryCount**: Maximum number of retries to check for cluster existance
* **Credential**: Credential used to join or leave domain

## Versions

### 1.1.0.0

* Removed requirement for CredSSP

### 1.0.0.0

* Initial release with the following resources:
    - xCluster and xWaitForCluster

## Examples

### Cluster example

In this example, we will create a failover cluster from two VMs. 
We will assume that a Domain Controller already exists, and that both VMs are already domain joined. 
Furthermore, the example assumes that your certificates are installed such that DSC can appropriately handle secrets such as the Domain Administrator Credential.
Finally, the xCluster module must also be installed on the VMs, as specified above.
For an example of an end to end scenario, check out the SQL HA Group blog post on the PowerShell Team Blog.

```powershell
Configuration ClusterDemo
{
    param([Parameter(Mandatory=$true)] 
          [ValidateNotNullorEmpty()] 
          [PsCredential] $domainAdminCred)

    Node $AllNodes.Where{$_.Role -eq "PrimaryClusterNode" }.NodeName
    {
        WindowsFeature FailoverFeature
        {
            Ensure = "Present"
            Name      = "Failover-clustering"
        }

        WindowsFeature RSATClusteringPowerShell
        {
            Ensure = "Present"
            Name   = "RSAT-Clustering-PowerShell"   

            DependsOn = "[WindowsFeature]FailoverFeature"
        }

        WindowsFeature RSATClusteringCmdInterface
        {
            Ensure = "Present"
            Name   = "RSAT-Clustering-CmdInterface"

            DependsOn = "[WindowsFeature]RSATClusteringPowerShell"
        }

        xCluster ensureCreated
        {
            Name = $Node.ClusterName
            StaticIPAddress = $Node.ClusterIPAddress
            DomainAdministratorCredential = $domainAdminCred

           DependsOn = “[WindowsFeature]RSATClusteringCmdInterface”
       } 

    }

    Node $AllNodes.Where{ $_.Role -eq "ReplicaServerNode" }.NodeName
    {         
        WindowsFeature FailoverFeature
        {
            Ensure = "Present"
            Name      = "Failover-clustering"
        }

        WindowsFeature RSATClusteringPowerShell
        {
            Ensure = "Present"
            Name   = "RSAT-Clustering-PowerShell"   

            DependsOn = "[WindowsFeature]FailoverFeature"
        }

        WindowsFeature RSATClusteringCmdInterface
        {
            Ensure = "Present"
            Name   = "RSAT-Clustering-CmdInterface"

            DependsOn = "[WindowsFeature]RSATClusteringPowerShell"
        }

        xWaitForCluster waitForCluster
        {
            Name = $Node.ClusterName
            RetryIntervalSec = 10
            RetryCount = 60

            DependsOn = “[WindowsFeature]RSATClusteringCmdInterface” 
        }

        xCluster joinCluster
        {
            Name = $Node.ClusterName
            StaticIPAddress = $Node.ClusterIPAddress
            DomainAdministratorCredential = $domainAdminCred

            DependsOn = "[xWaitForCluster]waitForCluster"
        }  

    }
}

$ConfigData = @{
    AllNodes = @(

        @{
            NodeName= "*"

            CertificateFile = "C:\keys\Dscdemo.cer"                 # use your own certificate
            Thumbprint = "E513EEFCB763E6954C52BA66A1A81231BF3F551E" # assume both machines have the same certificate to hold private key
                                                                    # replace the value of thumbprint with your own.

            ClusterName = "Cluster"
            ClusterIPAddress = "192.168.100.20/24"    # replace the ipaddress of your own.
        },

         # Node01
        @{
            NodeName= "Node01"   # rename to actual machine name of VM
            Role = "PrimaryClusterNode"
         },

         # Node02
         @{
            NodeName= "Node02"   # rename to actual machine name of VM
            Role = "ReplicaServerNode"
         }
    );
}

$domainAdminCred = Get-Credential -UserName "ClusterDemo\Administrator" -Message "Enter password for private domain Administrator"

ClusterDemo -ConfigurationData $ConfigData -domainAdminCred $domainAdminCred
```

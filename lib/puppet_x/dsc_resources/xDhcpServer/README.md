[![Build status](https://ci.appveyor.com/api/projects/status/uan12tf7tfxhg7m5/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xdhcpserver/branch/master)

# xDhcpServer

The **xDhcpServer** DSC resources are used for configuring and managing a DHCP server. They include **xDhcpServerScope**, **xDhcpServerReservation**, and **xDhcpServerOptions**. 

## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).


## Resources

* **xDhcpServerScope** sets a scope for consecutive range of possible IP addresses that the DHCP server can lease to clients on a subnet.
* **xDhcpServerReservation** sets lease assignments used to ensure that a specified client on a subnet can always use the same IP address.
* **xDhcpServerOptions** currently supports setting DNS domain and DNS Server IP Address options at a DHCP server scope level.


### xDhcpServerScope

* **IPStartRange**: Starting address to set for this scope
* **IPEndRange**: Ending address to set for this scope
* **Name**: Name of this DHCP Scope
* **SubnetMask**: Subnet mask for the scope specified in IP address format
* **LeaseDuration**: Time interval for which an IP address should be leased
* **State**: Whether scope should be active or inactive.
* **Ensure**: Whether DHCP scope should be present or removed
* **ScopeID**: Scope Identifier. This is a read-only property for this resource.

### xDhcpServerReservation

* **ScopeID**: ScopeId for which reservations are set
* **IPAddress**: IP address of the reservation for which the properties are modified
* **ClientMACAddress**: Client MAC Address to set on the reservation
* **Name**: Reservation name
* **AddressFamily**: Address family type. Note: at this time, only IPv4 is supported.
* **Ensure**: Whether option should be set or removed

### xDhcpServerOption

* **ScopeID**: ScopeID for which options are set
* **DnsServerIPAddress**: IP address of DNS Servers
* **DnsDomain**: Domain name of DNS Server
* **AddressFamily**: Address family type
* **Ensure**: Whether option should be set or removed


## Versions

### 1.2

* Fix "Cannot set default gateway on xDhcpServerOption".

### 1.1

* Bug fix, enables creating more than 1 DHCP server scope.

### 1.0

* Initial release with the following resources 
    * **xDhcpServerScope**
    * **xDhcpServerReservation**
    * **xDhcpServerOptions**

## Examples

### Creating a DHCP Server Scope

```powershell
configuration Sample_xDhcpsServerScope_NewScope
{
    Import-DscResource -module xDHCpServer
    xDhcpServerScope Scope
    {
        Ensure = 'Present'
        IPEndRange = '192.168.1.254'
        IPStartRange = '192.168.1.1'
        Name = 'PowerShellScope'
        SubnetMask = '255.255.255.0'
        LeaseDuration = '00:08:00'
        State = 'Active'
        AddressFamily = 'IPv4'
    }
}
```

### Reserving an IP address within a DHCP server

```powershell
configuration Sample_xDhcpServerReservation_IPReservation
{
    Import-DscResource -module xDHCpServer
    xDhcpServerReservation PullServerIP
    {
        Ensure = 'Present'
        ScopeID = '192.168.1.0'
        ClientMACAddress = '00155D8A54A1'
        IPAddress = '192.168.1.2'
        Name = 'DSCPullServer'
        AddressFamily = 'IPv4'
    }
}
```

### Setting the domain name for a DNS Server

```powershell
configuration Sample_xDhcpServerOption_SetScopeOption
{
    Import-DscResource -module xDHCpServer
    xDhcpServerOption Option
    {
        Ensure = 'Present'
        ScopeID = '192.168.1.0'
        DnsDomain = 'contoso.com'
        DnsServerIPAddress = '192.168.1.22','192.168.1.1'
        AddressFamily = 'IPv4'
        Router = '192.168.1.1'
    }
}
```

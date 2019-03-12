<#
    configuration Sample {
		Import-DSCResource -ModuleName WmiNamespaceSecurity

        WMINamespaceSecurity Jason {
            Path = "root/cimv2"
            Principal = "Jason"
            AppliesTo = "Self"
            AccessType = "Allow"
            Permission = "Enable", "MethodExecute", "ProviderWrite"
            Ensure = "Present"
        }

        WMINamespaceSecurity Steve {
            Path = "root/cimv2"
            Principal = "Steve"
            AppliesTo = "Children"
            AccessType = "Deny"
            Permission = "Enable", "MethodExecute", "ProviderWrite", "RemoteAccess"
            Ensure = "Present"
        }

    }
#>

Enum Ensure {
    Present
    Absent
}

Enum AccessType {
    Allow = 0
    Deny = 1
}

Enum AppliesTo {
    Self
    Children
}

Enum AceFlag {
    None = 0x0
    ObjectInherit = 0x1
    ContainerInherit = 0x2
    NoPropagateInherit = 0x4
    InheritOnly = 0x8
    Inherited = 0x10
}

[DSCResource()]
class WMINamespaceSecurity {
    [DscProperty(Key)]
    [ValidateNotNullOrEmpty()]
    [string] $Path

    [DscProperty(Key)]
    [ValidateNotNullOrEmpty()]
    [string] $Principal

    [DscProperty(Key)]
    [ValidateNotNullOrEmpty()]
    [string] $AccessType  #TODO: bug prevents using enum as key type

    [DscProperty()]
    [ValidateSet("Enable","MethodExecute","FullWrite","PartialWrite","ProviderWrite","RemoteAccess","Subscribe","Publish","ReadSecurity","WriteSecurity")]
    [ValidateNotNullOrEmpty()]
    [string[]] $Permission

    [DscProperty()]
    [AppliesTo] $AppliesTo = [AppliesTo]::Self

    [DscProperty()]
    [Ensure] $Ensure = [Ensure]::Present

    [DscProperty(NotConfigurable)]
    [bool] $Inherited

    static [string[]] SplitPrincipal([string] $Principal) {
        $domain = $env:COMPUTERNAME
        if ($Principal.Contains("\")) {
            return $Principal.Split("\")
        } else {
            return $domain, $Principal
        }
    }

    static [CimInstance] GetSecurityDescriptor([string] $Namespace) {
        $systemSecurity = Get-CimInstance -Namespace $Namespace -ClassName __SystemSecurity
        $output = Invoke-CimMethod -InputObject $systemSecurity -MethodName GetSecurityDescriptor
        return $output.Descriptor
    }

    static [Object] FindAce([CimInstance[]] $acl, [string] $principal, [string] $accessTypeName) {
        [AccessType] $access = [AccessType]::Allow
        switch ($accessTypeName) { #TODO: fix once enum is supported as key type
            "Allow" {
                $access = [AccessType]::Allow
            }

            "Deny" {
                $access = [AccessType]::Deny
            }

            default {
                throw "Unknown AccessType: $accessTypeName"
            }
        }
        $domain, $user = [WMINamespaceSecurity]::SplitPrincipal($principal)
        $index = 0
        foreach ($ace in $acl) {
            $trustee = $ace.Trustee
            if ($trustee.Domain -eq $domain -and $trustee.Name -eq $user -and $ace.AceType -eq $access) {
                return $ace, $index
            }
            $index ++
        }
        return $null, -1
    }

    [void] Set() {
        $sd = [WMINamespaceSecurity]::GetSecurityDescriptor($this.Path)
        [int] $index = -1

        #only support DACL for now, SACL support can be added in the future
        $ace, $index = [WMINamespaceSecurity]::FindAce($sd.DACL, $this.Principal, $this.AccessType)
        if ($this.Ensure -eq [Ensure]::Present) {
            if ($ace -eq $null) {
                $domain, $user = [WMINamespaceSecurity]::SplitPrincipal($this.Principal)
                $ntuser = New-Object System.Security.Principal.NTAccount($domain,$user)
                $trustee = New-CimInstance -Namespace root/cimv2 -ClassName Win32_Trustee -ClientOnly -Property @{Domain=$domain;Name=$user;
                    SidString=$ntuser.Translate([System.Security.Principal.SecurityIdentifier]).Value}
                $ace = New-CimInstance -Namespace root/cimv2 -ClassName Win32_Ace  -ClientOnly -Property @{AceType=[uint32]0;Trustee=$trustee;AccessMask=[uint32]0;AceFlags=[uint32]0}
                switch ($this.AccessType) { #TODO: fix once enum is supported as key type
                    "Allow" {
                        $ace.AceType = [int]([AccessType]::Allow)
                    }

                    "Deny" {
                        $ace.AceType = [int]([AccessType]::Deny)
                    }

                    default {
                        throw "Unknown AccessType: $($this.AccessType)"
                    }
                }
            }
            [int] $accessmask = 0
            $WMIPermission = @{
                enable = 1;
                methodexecute = 2;
                fullwrite = 4;
                partialwrite = 8;
                providerwrite = 0x10;
                remoteaccess = 0x20;
                subscribe = 0x40;
                publish = 0x80;
                readsecurity = 0x20000;
                writesecurity = 0x40000
            }
            foreach ($permission in $this.Permission) {
                $accessmask += [int]($WMIPermission[$permission.ToLower()])
            }
            $ace.AccessMask = $accessmask
            switch ($this.AppliesTo) {
                "Self" {
                    $ace.AceFlags = [AceFlag]::None
                }

                "Children" {
                    $ace.AceFlags = [AceFlag]::ContainerInherit
                }

                Default {
                    throw "Unknown AppliesTo"
                }
            }

            if ($index -ge 0) { # copy new ACE flags and accessmask over old one
                $sd.DACL[$index].AceFlags = $ace.AceFlags
                $sd.DACL[$index].AccessMask = $ace.AccessMask
            } else {
                # insert to end, TODO: insert in front of Deny ACE
                # resulting CIMInstance has a fixed size collection, so we can't just use the Add() method
                [CIMInstance[]] $newDacl = $null
                foreach ($existingAce in $sd.DACL) {
                    $newDacl += $existingAce
                }
                $newDacl += $ace
                $sd.DACL = $newDacl
            }
        } elseif ($this.Ensure -eq [Ensure]::Absent) {
            if ($ace -ne $null) {
                # remove the Ace since it exists
                [CIMInstance[]] $newDacl = $null
                for ($i = 0; $i -lt $sd.DACL.Count; $i++) {
                    if ($i -ne $index) {
                        $newDacl += $sd.DACL[$i]
                    }
                }
                $sd.DACL = $newDacl
            }
        } else {
            throw "Unknown value '$($this.Ensure)' for Ensure"
        }

        $systemSecurity = Get-CimInstance -Namespace $this.Path __systemsecurity
        $retVal = Invoke-CimMethod -InputObject $systemSecurity -MethodName SetSecurityDescriptor -Arguments @{ Descriptor = $sd }
        if ($retVal.ReturnValue -ne 0) {
            throw "SetSecurityDescriptor failed with $($retVal.ReturnValue)"
        }
    }

    [bool] Test() {
        $wmiNamespace = $this.Get()
        if ($this.Ensure -eq [Ensure]::Absent -and $wmiNamespace -eq $null)
        {
            return $true
        } elseif ($this.Ensure -eq [Ensure]::Present -and $wmiNamespace -ne $null) {
            return $true
        } 
        else {
            return $false
        }
    }

    [WMINamespaceSecurity] Get() {
        $sd = [WMINamespaceSecurity]::GetSecurityDescriptor($this.Path)
        $ace, $index = [WMINamespaceSecurity]::FindAce($sd.DACL, $this.Principal, $this.AccessType)
        if ($ace -ne $null) {
            $this.Inherited = ($ace.AceFlags -band [AceFlag]::Inherited)
            if ($ace.AceFlags -band [AceFlag]::ContainerInherit)
            {
                $this.AppliesTo = [AppliesTo]::Children
            }
            else
            {
                $this.AppliesTo = [AppliesTo]::Self
            }
            return $this
        } else {
            return $null
        }
    }
}
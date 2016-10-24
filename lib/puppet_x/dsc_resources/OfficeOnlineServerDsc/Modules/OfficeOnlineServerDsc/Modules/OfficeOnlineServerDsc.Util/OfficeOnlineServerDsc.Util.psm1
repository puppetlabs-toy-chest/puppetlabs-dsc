<#
.SYNOPSIS

This cmdlet determines the version number of Office Web Apps that is installed locally

#>
function Get-OosDscInstalledProductVersion
{
    [CmdletBinding()]
    [OutputType([Version])]
    param()

    return Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | `
        Select-Object DisplayName, DisplayVersion | `
        Where-Object {
            $_.DisplayName -eq "Microsoft Office Web Apps Server 2013" -or `
            $_.DisplayName -eq "Microsoft Office Online Server"
        } | ForEach-Object -Process {
            return [Version]::Parse($_.DisplayVersion)
        } | Select-Object -First 1
}


<#
.SYNOPSIS

This cmdlet determines if the OU of the farm matches the OU of the current deployment

.PARAMETER DesiredOU

The name of the OU that the farm should be in

.PARAMETER ExistingOU

The name of the OU that the farm currently is in

#>
function Test-OosDscFarmOu
{
    [cmdletbinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [string]
        $DesiredOU,
        
        [parameter(Mandatory = $true)]
        [object]
        $ExistingOU
    )

    $adsi = [adsisearcher]'(objectCategory=organizationalUnit)'
    $adsi.Filter = "name=$DesiredOU"
    $ou = $adsi.FindAll()
    if($ou.path){
        $searchRoot = "," + $adsi.SearchRoot.Path -replace 'LDAP://'
        $ldapResult = $ou.path -replace $searchRoot
        Write-Verbose -Message "LDAP search result: $ldapResult"
        Write-Verbose "Current Farm OU: $ExistingOU"
        return ($ldapResult -contains $ExistingOU)
    }
    else
    {
        throw "$DesiredOU not found"
    }
}

<#
.SYNOPSIS

This method is used to compare current and desired values for any DSC resource

.PARAMETER CurrentValues

This is hashtable of the current values that are applied to the resource

.PARAMETER DesiredValues 

This is a PSBoundParametersDictionary of the desired values for the resource

.PARAMETER ValuesToCheck

This is a list of which properties in the desired values list should be checkked.
If this is empty then all values in DesiredValues are checked.

#>
function Test-OosDscParameterState() {
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true, Position=1)]  
        [HashTable]
        $CurrentValues,
        
        [parameter(Mandatory = $true, Position=2)]  
        [Object]
        $DesiredValues,

        [parameter(Mandatory = $false, Position=3)] 
        [Array]
        $ValuesToCheck
    )

    $returnValue = $true

    if (($DesiredValues.GetType().Name -ne "HashTable") `
        -and ($DesiredValues.GetType().Name -ne "CimInstance") `
        -and ($DesiredValues.GetType().Name -ne "PSBoundParametersDictionary")) 
    {
        throw ("Property 'DesiredValues' in Test-SPDscParameterState must be either a " + `
               "Hashtable or CimInstance. Type detected was $($DesiredValues.GetType().Name)")
    }

    if (($DesiredValues.GetType().Name -eq "CimInstance") -and ($null -eq $ValuesToCheck)) 
    {
        throw ("If 'DesiredValues' is a Hashtable then property 'ValuesToCheck' must contain " + `
               "a value")
    }

    if (($null -eq $ValuesToCheck) -or ($ValuesToCheck.Count -lt 1)) 
    {
        $KeyList = $DesiredValues.Keys
    } 
    else 
    {
        $KeyList = $ValuesToCheck
    }

    $KeyList | ForEach-Object -Process {
        if ($_ -ne "Verbose") 
        {
            if (($CurrentValues.ContainsKey($_) -eq $false) `
            -or ($CurrentValues.$_ -ne $DesiredValues.$_) `
            -or (($DesiredValues.ContainsKey($_) -eq $true) -and ($DesiredValues.$_.GetType().IsArray))) 
            {
                if ($DesiredValues.GetType().Name -eq "HashTable" -or `
                    $DesiredValues.GetType().Name -eq "PSBoundParametersDictionary") 
                {
                    $CheckDesiredValue = $DesiredValues.ContainsKey($_)
                } 
                else 
                {
                    $CheckDesiredValue = Test-SPDSCObjectHasProperty $DesiredValues $_
                }

                if ($CheckDesiredValue) 
                {
                    $desiredType = $DesiredValues.$_.GetType()
                    $fieldName = $_
                    if ($desiredType.IsArray -eq $true) 
                    {
                        if (($CurrentValues.ContainsKey($fieldName) -eq $false) `
                        -or ($null -eq $CurrentValues.$fieldName)) 
                        {
                            Write-Verbose -Message ("Expected to find an array value for " + `
                                                    "property $fieldName in the current " + `
                                                    "values, but it was either not present or " + `
                                                    "was null. This has caused the test method " + `
                                                    "to return false.")
                            $returnValue = $false
                        } 
                        else 
                        {
                            $arrayCompare = Compare-Object -ReferenceObject $CurrentValues.$fieldName `
                                                           -DifferenceObject $DesiredValues.$fieldName
                            if ($null -ne $arrayCompare) 
                            {
                                Write-Verbose -Message ("Found an array for property $fieldName " + `
                                                        "in the current values, but this array " + `
                                                        "does not match the desired state. " + `
                                                        "Details of the changes are below.")
                                $arrayCompare | ForEach-Object -Process {
                                    Write-Verbose -Message "$($_.InputObject) - $($_.SideIndicator)"
                                }
                                $returnValue = $false
                            }
                        }
                    } 
                    else 
                    {
                        switch ($desiredType.Name) 
                        {
                            "String" {
                                if ([string]::IsNullOrEmpty($CurrentValues.$fieldName) `
                                -and [string]::IsNullOrEmpty($DesiredValues.$fieldName)) 
                                {} 
                                else 
                                {
                                    Write-Verbose -Message ("String value for property " + `
                                                            "$fieldName does not match. " + `
                                                            "Current state is " + `
                                                            "'$($CurrentValues.$fieldName)' " + `
                                                            "and desired state is " + `
                                                            "'$($DesiredValues.$fieldName)'")
                                    $returnValue = $false
                                }
                            }
                            "Int32" {
                                if (($DesiredValues.$fieldName -eq 0) `
                                -and ($null -eq $CurrentValues.$fieldName)) 
                                {} 
                                else 
                                {
                                    Write-Verbose -Message ("Int32 value for property " + `
                                                            "$fieldName does not match. " + `
                                                            "Current state is " + `
                                                            "'$($CurrentValues.$fieldName)' " + `
                                                            "and desired state is " + `
                                                            "'$($DesiredValues.$fieldName)'")
                                    $returnValue = $false
                                }
                            }
                            "Int16" {
                                if (($DesiredValues.$fieldName -eq 0) `
                                -and ($null -eq $CurrentValues.$fieldName)) 
                                {} 
                                else 
                                {
                                    Write-Verbose -Message ("Int16 value for property " + `
                                                            "$fieldName does not match. " + `
                                                            "Current state is " + `
                                                            "'$($CurrentValues.$fieldName)' " + `
                                                            "and desired state is " + `
                                                            "'$($DesiredValues.$fieldName)'")
                                    $returnValue = $false
                                }
                            }
                            default {
                                Write-Verbose -Message ("Unable to compare property $fieldName " + `
                                                        "as the type ($($desiredType.Name)) is " + `
                                                        "not handled by the " + `
                                                        "Test-SPDscParameterState cmdlet")
                                $returnValue = $false
                            }
                        }
                    }
                }            
            }
        } 
    }
    return $returnValue
}

Export-ModuleMember -Function *

Import-Module "$PSScriptRoot\..\DSCResources\xTimeZone\xTimeZone.psm1" -Prefix 'TimeZone' -Force

Describe 'Schema' {
    it 'IsSingleInstance should be mandatory with one value.' {
        $timeZoneResource = Get-DscResource -Name xTimeZone
        $timeZoneResource.Properties.Where{$_.Name -eq 'IsSingleInstance'}.IsMandatory | should be $true
        $timeZoneResource.Properties.Where{$_.Name -eq 'IsSingleInstance'}.Values | should be 'Yes'
    }
}
Describe 'Get-TargetResource'{
    Mock -ModuleName xTimeZone -CommandName Get-TimeZone -MockWith {
        Write-Output 'Pacific Standard Time'
    }
    
     $TimeZone = Get-TimeZoneTargetResource -TimeZone 'Pacific Standard Time' -IsSingleInstance 'Yes'

    It 'Should return hashtable with Key TimeZone'{
        $TimeZone.ContainsKey('TimeZone') | Should Be $true            
    }
     
    It 'Should return hashtable with Value that matches "Pacific Standard Time"'{
        $TimeZone.TimeZone = 'Pacific Standard Time'    
    }
}

Describe 'Set-TargetResource'{

    Mock -ModuleName xTimeZone -CommandName Set-TimeZone -MockWith {
        Write-Output $true
    }
    
    Mock -ModuleName xTimeZone -CommandName Get-TimeZone -MockWith {
        Write-Output 'Eastern Standard Time'    
    }    

    It 'Call Set-TimeZone' {
        Set-TimeZoneTargetResource -TimeZone 'Pacific Standard Time' -IsSingleInstance 'Yes'
        Assert-MockCalled -ModuleName xTimeZone -CommandName Set-TimeZone -Exactly 1 
    }

    It 'Should not call Set-TimeZone when Current TimeZone already set to desired State'{
        $SystemTimeZone = Get-TimeZoneTargetResource -TimeZone 'Eastern Standard Time'  -IsSingleInstance 'Yes'
        Set-TimeZoneTargetResource -TimeZone $SystemTimeZone.TimeZone  -IsSingleInstance 'Yes'
        Assert-MockCalled -ModuleName xTimeZone -CommandName Set-TimeZone -Scope It -Exactly 0
    }
}

Describe 'Test-TargetResource'{
    Mock -ModuleName xTimeZone -CommandName Get-TimeZone -MockWith {
        Write-Output 'Pacific Standard Time'        
    }

    It 'Should return true when Test is passed Time Zone thats already set'{
        Test-TimeZoneTargetResource -TimeZone 'Pacific Standard Time' -IsSingleInstance 'Yes' | Should Be $true
    }

    It 'Should return false when Test is passed Time Zone that is not set'{
        Test-TimeZoneTargetResource -TimeZone 'Eastern Standard Time' -IsSingleInstance 'Yes' | Should Be $false
    }

}

#--------------------------------------------------------------------------------- #The sample scripts are not supported under any Microsoft standard support #program or service. The sample scripts are provided AS IS without warranty  #of any kind. Microsoft further disclaims all implied warranties including,  #without limitation, any implied warranties of merchantability or of fitness for #a particular purpose. The entire risk arising out of the use or performance of  #the sample scripts and documentation remains with you. In no event shall #Microsoft, its authors, or anyone else involved in the creation, production, or #delivery of the scripts be liable for any damages whatsoever (including, #without limitation, damages for loss of business profits, business interruption, #loss of business information, or other pecuniary loss) arising out of the use #of or inability to use the sample scripts or documentation, even if Microsoft #has been advised of the possibility of such damages #--------------------------------------------------------------------------------- 

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [String]
        $StartPage,

        [String]
        $SecondaryStartPages
    )
    
    $IEMainReg = 'HKLM:\Software\Microsoft\Internet Explorer\Main' 

    Write-Verbose "Detecting the start page of Internet Explorer."
    $StartPageReg = (Get-ItemProperty -Path $IEMainReg).'Start Page'

    Write-Verbose "Detecting the secondary start pages of Internet Explorer."
    $SecondaryStartPagesReg = (Get-ItemProperty -Path $IEMainReg).'Secondary Start Pages'


    $returnValue = @{
                        #Verify that the value exists, if it does not exist, the value of output is "NULL".
                        StartPage = $(If($StartPageReg){$StartPageReg}Else{"NULL"})
                        SecondaryStartPages = $(If($SecondaryStartPagesReg){$SecondaryStartPagesReg}Else{"NULL"})
                    }

    If($SecondaryStartPages)
    {
        If($($StartPage -eq $StartPageReg) -and $($SecondaryStartPages -eq $SecondaryStartPagesReg))
        {
            $returnValue.Ensure = "Present"
        }
        Else
        {
            $returnValue.Ensure = "Absent"
        }
    }
    Else
    {
        If($StartPage -eq $StartPageReg)
        {
            $returnValue.Ensure = "Present"
        }
        Else
        {
            $returnValue.Ensure = "Absent"
        }
    }

    $returnValue
}


function Set-TargetResource
{
    [CmdletBinding(SupportsShouldProcess=$true)]
    param
    (
        [parameter(Mandatory = $true)]
        [String]
        $StartPage,

        [String]
        $SecondaryStartPages,

        [ValidateSet("Present","Absent")]
        [String]
        $Ensure = 'Present'
    )

    $IEMainReg = 'HKLM:\Software\Microsoft\Internet Explorer\Main' 

    Switch($Ensure)
    {
        #Set the home page of IE
        'Present'
        {
            If($SecondaryStartPages)
            {
                If($PSCmdlet.ShouldProcess("Internet Explorer","Set the start page and secondary start page"))
                {
                    Try
                    {
                        Write-Verbose "Setting the start page of Internet Explorer."
                        Set-ItemProperty -Path $IEMainReg -Name "Start Page" -Value "$StartPage" -ErrorAction Stop
                    
                        Write-Verbose "Setting the secondary start page of Internete Explorer."
                        Set-ItemProperty -Path $IEMainReg -Name "Secondary Start Pages" -Value "$SecondaryStartPages" -ErrorAction Stop
                    }
                    Catch
                    {
                        $ErrorMsg = $_.Exception.Message                        Write-Verbose $ErrorMsg
                    }
                }
            }
            Else
            {
                If($PSCmdlet.ShouldProcess("Internet Explorer","Set the start page"))
                {
                    Try
                    {
                        Write-Verbose "Setting the start page of Internet Explorer."
                        Set-ItemProperty -Path $IEMainReg -Name "Start Page" -Value "$StartPage" -ErrorAction Stop
                 
                    }
                    Catch
                    {
                        $ErrorMsg = $_.Exception.Message                        Write-Verbose $ErrorMsg
                    } 
                }
            }
        }

        #Remove the home page of IE
        'Absent'
        {
            If($SecondaryStartPages)
            {
                If($PSCmdlet.ShouldProcess("Internet Explorer","Remove the start page and secondary start page"))
                {
                    Try
                    {
                        Write-Verbose "Removing the start page of Internete Explorer."
                        Set-ItemProperty -Path $IEMainReg -Name "Start Page" -Value "" -ErrorAction Stop

                        Write-Verbose "Removing the secondary start page of Internete Explorer."
                        Set-ItemProperty -Path $IEMainReg -Name "Secondary Start pages" -Value "" -ErrorAction Stop
                    }
                    Catch
                    {
                        $ErrorMsg = $_.Exception.Message                        Write-Verbose $ErrorMsg
                    }
                }
            }
            Else
            {
                If($PSCmdlet.ShouldProcess("Internet Explorer","Remove the start page"))
                {
                    Try
                    {
                        Write-Verbose "Removing the start page of Internete Explorer."
                        Set-ItemProperty -Path $IEMainReg -Name "Start Page" -Value "" -ErrorAction Stop
                    }
                    Catch
                    {
                        $ErrorMsg = $_.Exception.Message                        Write-Verbose $ErrorMsg
                    }
                }
            }
        }
    }
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [String]
        $StartPage,

        [String]
        $SecondaryStartPages,

        [ValidateSet("Present","Absent")]
        [String]
        $Ensure = 'Present'
    )


    #Output the result of Get-TargetResource function.
    $Get = Get-TargetResource -StartPage $StartPage -SecondaryStartPages $SecondaryStartPages

    Switch($Ensure)
    {
        'Present'
        {
            If($SecondaryStartPages)
            {
                If($StartPage -eq $Get.StartPage -and $SecondaryStartPages -eq $Get.SecondaryStartPages)
                {
                    return $true
                }
                Else
                {
                    return $false
                }
            }
            Else
            {
                If($StartPage -eq $Get.StartPage -and $SecondaryStartPages -eq $Get.SecondaryStartPages)
                {
                    return $true
                }
                Else
                {
                    return $false
                }
            }
        }

        'Absent'
        {
           If($SecondaryStartPages)
           {
                If($Get.StartPage -eq "NULL" -and $Get.SecondaryStartPages -eq "NULL")
                {
                    return $true
                }
                Else
                {
                    return $false
                }
           }
           Else
           {
                If($Get.StartPage -eq "NULL")
                {
                    return $true
                }
                Else
                {
                    return $false
                }             
           }
        }
    }
}

Export-ModuleMember -Function *-TargetResource




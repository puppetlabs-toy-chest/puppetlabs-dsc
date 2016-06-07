#########################################################################################################################################
# xWebPackageDeploy module for deploying IIS WebSite using web deploy IIS extension. This resource assumes that WebDeploy tool
# is installed in IIS.
#########################################################################################################################################


#########################################################################################################################################
# Get-TargetResource ([string]$SourcePath, [string]$Destination) : given the package and IIS website name or content path, determine whether
# the package is deployed and return the result
#########################################################################################################################################

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

       [parameter(Mandatory = $true)]
        [System.String]
        $Destination
    )

    $appCmd = "$env:PROGRAMFILES\IIS\Microsoft Web Deploy V3\msdeploy.exe"
    $ensure = "Absent"
    Write-Verbose -Message "Calling msdeploy.exe to retrieve the site content in a zip file format"
      & $appCmd -verb:sync "-source:contentPath=$Destination" "-dest:package=$SourcePath" 

    # $Destination in this case points to website content full path.
    if(Test-Path($Destination))
    {
        $ensure = "Present"
    }        
    else
    {
        # this is the case where $Destination points to IIS website name and not the website content path
        $site = Get-ItemProperty -Path "IIS:\Sites\$Destination" -ErrorAction SilentlyContinue
        if ($site -ne $null)
        {
           $path = $site.physicalPath           
           if(Test-Path($path))
           {
             $ensure = "Present"
           }
        }
    }

    $returnValue = @{
    SourcePath = $SourcePath
    Destination = $Destination            
    Ensure = $ensure}    

    $returnValue
    
}

#########################################################################################################################################
# Set-TargetResource ([string]$SourcePath, [string]$Destination, [string]$Ensure) : given the package and IIS website name or content path, deploy/remove
# the website content
#########################################################################################################################################

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [parameter(Mandatory = $true)]
        [System.String]
        $Destination,
        
          [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = "Present"
    )

    Write-Verbose -Message "Calling msdeploy.exe to sync the site content from a given zip package"

    $app = "$env:PROGRAMFILES\IIS\Microsoft Web Deploy V3"

    $appCmd = Join-Path $app -ChildPath "msdeploy.exe"
    $appCmd = "& '$appCmd'"   
        
    if($Ensure -eq "Present")
    {
        #sync the given package content into iis
        
        if($Destination.Contains("\"))
        {
              #this is the case when iis site content path is specified
             $appCmd += "-verb:sync -source:package=$SourcePath -dest:contentPath=$Destination"
        }
        else
        {
            #this is the case when iis site name is specified
            $appCmd += "-verb:sync -source:package=$SourcePath -dest:iisApp=$Destination"           
        }
        Write-Verbose -Message $appCmd
        Invoke-Expression $appCmd

    }
    else
    {
      #delete the website content    
      if($Destination.Contains("\"))
      {
        # $SourcePath in this case points to physical path of the website.
          Remove-Item -Path $Destination -Recurse -ErrorAction SilentlyContinue 
      }      
      else
      {
        # this is the case where $SourcePath points to IIS website name and not the actual path
        $site = Get-ItemProperty -Path "IIS:\Sites\$Destination" -ErrorAction SilentlyContinue
        if ($site -ne $null)
        {
           $path = $site.physicalPath
           $files = Get-Item -Path $path -ErrorAction SilentlyContinue           
           Remove-Item -Path $files -Recurse -ErrorAction SilentlyContinue 
        }
      }  

    }    
}

#########################################################################################################################################
# Test-TargetResource ([string]$SourcePath, [string]$Destination, [string]$Ensure) : given the package and IIS website name or content path, 
# determine whether the package is deployed or not.
#########################################################################################################################################

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [parameter(Mandatory = $true)]
        [System.String]
        $Destination,

        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = "Present"
    )
    $result = $false    
    $appCmd = "$env:PROGRAMFILES\IIS\Microsoft Web Deploy V3\msdeploy.exe"

    #get all the files from a given package
    $packageFiles = & $appCmd -verb:dump "-source:package=$SourcePath"
 
    if($Ensure -eq "Present")
    {
         #find all the files for a given site
        $siteFiles = & $appCmd -verb:dump "-source:contentPath=$Destination"
        # the packages exported using webdeploy tool, contain 2 extra entries with site name. Skipping those..
        #compare based on the number of files
        if(($packageFiles.Count -eq $siteFiles.Count) -or (($packageFiles.Count -2) -eq $siteFiles.Count) )
        {
            $result = $true
        }
     }   
    else
    {       
        #find the website's physical path if $Destination points to a site name
        $site = Get-ItemProperty -Path "IIS:\Sites\$Destination" -ErrorAction SilentlyContinue
        if ($site -ne $null)
        {
           $path = $site.physicalPath
           $files = Get-Item -Path $path -ErrorAction SilentlyContinue
           if ($files -ne $null)
            {
                $f = $files.GetFiles()
            }
            if($f.Count >1)
            {
                $result = $true
            }            
        }
        #this is the case when $Destination points to the website's physical path 
        else
        {
            if(Test-Path($Destination))
            {
                $result = $true
            } 
        }
     }
    $result    
}






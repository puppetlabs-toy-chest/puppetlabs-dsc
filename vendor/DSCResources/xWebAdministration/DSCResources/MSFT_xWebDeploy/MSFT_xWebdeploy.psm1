#########################################################################################################################################
# xWebDeploy module for Importing/Exporting IIS WebSite using web deploy custom IIS extension. This resource assume that WebDeploy extension
# is installed and enabled in IIS.
#########################################################################################################################################


#########################################################################################################################################
# Get-TargetResource ([string]$PackagePath, [string]$ContentPath) : given the package and IIS website name or content path, determine whether
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
		$PackagePath,

       [parameter(Mandatory = $true)]
		[System.String]
		$ContentPath
	)

    $appCmd = "$env:PROGRAMFILES\IIS\Microsoft Web Deploy V3\msdeploy.exe"
    $ensure = "Absent"
	Write-Verbose -Message "Calling msdeploy.exe to retrieve the site content in a zip file format"
      & $appCmd -verb:sync "-source:contentPath=$ContentPath" "-dest:package=$PackagePath" 

    # $ContentPath in this case points to physical path of the website.
    if(Test-Path($ContentPath))
    {
        $ensure = "Present"
    }        
	else
    {
        # this is the case where $ContentPath points to IIS website name and not the actual path
		$site = Get-ItemProperty -Path "IIS:\Sites\$ContentPath" -ErrorAction SilentlyContinue
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
		PackagePath = $PackatePath
       ContentPath = $ContentPath			
		Ensure = $ensure}	

	$returnValue
	
}

#########################################################################################################################################
# Set-TargetResource ([string]$PackagePath, [string]$ContentPath, [string]$Ensure) : given the package and IIS website name or content path, deploy/remove
# the website content
#########################################################################################################################################

function Set-TargetResource
{
	[CmdletBinding()]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$PackagePath,

		[parameter(Mandatory = $true)]
		[System.String]
		$ContentPath,
		
      	[ValidateSet("Present","Absent")]
		[System.String]
		$Ensure = "Present"
	)

	Write-Verbose -Message "Calling msdeploy.exe to sync the site content from a zip package"

    $app = "$env:PROGRAMFILES\IIS\Microsoft Web Deploy V3"

    $appCmd = Join-Path $app -ChildPath "msdeploy.exe"
    $appCmd = "& '$appCmd'"   
        
    if($Ensure -eq "Present")
    {
        #sync the given package content into iis inetpub
        
        if($ContentPath -contains "\")
        {
              #this is the case when iis site content path is specified
             $appCmd += "-verb:sync -source:package=$PackagePath -dest:contentPath=$ContentPath"
        }
        else
        {
            #this is the case when iis site name is specified
            $appCmd += "-verb:sync -source:package=$PackagePath -dest:iisApp=$ContentPath"           
        }
        Write-Verbose -Message $appCmd
        Invoke-Expression $appCmd

    }
    else
    {
      #delete the website content    
      if($ContentPath -contains "\")
      {
		# $ContentPath in this case points to physical path of the website.
          Remove-Item -Path $ContentPath -Recurse -ErrorAction SilentlyContinue 
      }      
      else
      {
        # this is the case where $ContentPath points to IIS website name and not the actual path
		$site = Get-ItemProperty -Path "IIS:\Sites\$ContentPath" -ErrorAction SilentlyContinue
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
# Test-TargetResource ([string]$PackagePath, [string]$ContentPath, [string]$Ensure) : given the package and IIS website name or content path, 
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
		$PackagePath,

		[parameter(Mandatory = $true)]
		[System.String]
		$ContentPath,

		[ValidateSet("Present","Absent")]
		[System.String]
		$Ensure = "Present"
	)
    $result = $false    
    $appCmd = "$env:PROGRAMFILES\IIS\Microsoft Web Deploy V3\msdeploy.exe"

    #get all the files from a given package
    $packageFiles = & $appCmd -verb:dump "-source:package=$PackagePath"
 
    if($Ensure -eq "Present")
    {
         #find all the files for a given site
        $siteFiles = & $appCmd -verb:dump "-source:contentPath=$ContentPath"
        # the packages exported using webdeploy tool, content has 2 extra redundant entries for site name.
        #compare
        if(($packageFiles.Count -eq $siteFiles.Count) -or (($packageFiles.Count -2) -eq $siteFiles.Count) )
        {
            $result = $true
        }
     }   
	else
    {
       
        #find the website's physical path if $ContentPath points to a site name
        $site = Get-ItemProperty -Path "IIS:\Sites\$ContentPath" -ErrorAction SilentlyContinue
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
        #this is the case when $ContentPath points to the website's physical path 
        else
        {
            if(Test-Path($ContentPath))
            {
                $result = $true
            } 
        }
     }
    $result	
}




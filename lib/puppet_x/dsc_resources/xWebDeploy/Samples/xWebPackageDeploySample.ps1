###################
# Configuration script to deploy a website using webdeploy IIS extension. This sample assumes that Web Deploy extension is installed in IIS, and the website content is packaged in a zip file using web deploy extension.
###################

configuration DeployWebSiteUsingWebDeploy
{
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $SourcePath,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $Destination

    )
    
    Import-DscResource -Name xWebDeploy

    node ("localhost")
    {                  
       xWebPackageDeploy DeployWebPackage
       {
            SourcePath = $SourcePath
            Destination = $Destination
            Ensure = "Present"

       } 
    }
}


#Create localhost.mof
DeployWebSiteUsingWebDeploy -output "$env:temp\DeployWebSiteUsingWebDeploy"



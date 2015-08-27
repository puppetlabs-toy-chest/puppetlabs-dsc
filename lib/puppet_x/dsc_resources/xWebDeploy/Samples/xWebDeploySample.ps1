# This is a sample configuration to deploy a web server in IIS using xWebDeploy composite resource.Note that xWebDeploy version 3.5 is installing WebDeploy extension using the following URL: http://go.microsoft.com/fwlink/?LinkID=309497. 
# If you need to install web deploy from a different location, you  need to pass $WebDeployMsi parameter (can be physical path or URI).

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
        
        xWebDeploy Deploy
        {
            SourcePath = $SourcePath  #the full path to zip package to install IIS site from.
            Destination = $Destination #can be either IIS site name or the website phisical path
            Ensure = "Present"
            
        }   
    }
}

DeployWebSiteUsingWebDeploy -output "$env:temp\DeployWebSiteUsingWebDeploy"

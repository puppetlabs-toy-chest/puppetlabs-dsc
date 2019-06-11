# Composite configuration to install the Web Deploy 3.5 IIS extension (MSDeploy) from default URL : http://go.microsoft.com/fwlink/?LinkID=309497. Supports MSWebDeploy sync, dump verbs with iisApp , contentPath parameters.
# Examples of sync verb used with ContentPath and iisApp paramters:
#            -verb:sync -source:package=$SourcePath -dest:contentPath=$Destination       
#            -verb:sync -source:package=$SourcePath -dest:iisApp=$Destination
#
# Default path where the resource is expected to be placed: $env:ProgramFiles# \WindowsPowerShell\Modules\xWebDeploy\InstallerMsi . 
# Change the default path if needed.

#Install Web Deploy 3.5 
Configuration xInstallWebDeploy
{
    param
    (
        [Parameter(Mandatory = $true)]
        [Validateset("Present","Absent")]
        [String]
        $Ensure,

        [string] $WebDeployMsi = "http://go.microsoft.com/fwlink/?LinkID=309497"

    )    

    Package InstallWebDeployTool
          {
            Path  = $WebDeployMsi
            ProductId = "{1A81DA24-AF0B-4406-970E-54400D6EC118}"
            Name = "Microsoft Web Deploy 3.5"
            Arguments = "/quiet"
            Ensure = $Ensure
          }  
}

# Composite configuration to install an IIS site from a given package. Note that the package has to be created using webdeploy extension.
Configuration xWebDeploy
{
    param(
        
        [Parameter(Mandatory = $true)]
        [string] $SourcePath,

        [Parameter(Mandatory = $true)]
        [string] $Destination,

        [Parameter(Mandatory = $true)]
        [Validateset("Present","Absent")]
        [String]
        $Ensure,

        [string] $WebDeployMsi = "http://go.microsoft.com/fwlink/?LinkID=309497"

      
    )      
   Import-DSCResource -Name xWebPackageDeploy
    #Install WebDeploy IIS extension on the machine
    xInstallWebDeploy InstallWebDeployTool
        {
            Ensure = $Ensure
            WebDeployMsi = $WebDeployMsi
        }

    #Deploy a web package in IIS
    xWebPackageDeploy DeployWebPackage
       {
            SourcePath = $SourcePath
            Destination = $Destination
            Ensure = $Ensure

       } 
}

Export-ModuleMember -Function xInstallWebDeploy
Export-ModuleMember -Function xWebDeploy


# Composite configuration to install the IIS WordPress IIS site
# This does not setup the actual WordPress Site
configuration xIisWordPressSite
{
    param
    (
        [Parameter(Mandatory = $true)]
        [string] $DestinationPath,

        [Parameter(Mandatory = $true)]
        [string] $DownloadUri,

        [Parameter(Mandatory = $true)]
        [string] $PackageFolder,

        [Parameter(Mandatory = $true)]
        [string] $Configuration
    )

        [string] $BinaryFolder = Join-Path $DestinationPath "WordPress"

            # Make sure the WordPress site folder is present
            File WordPressFolder
            {
                DestinationPath = $BinaryFolder
                Type = "Directory"
                Ensure = "Present"

            }

            # Make sure the default IIS does not interfere with the WordPress site
            # Should be removed once WordPress site launches by it is own URL and not using iis default url
            xWebSite DefaultIisSite
            {
                Name = "Default Web Site"
                PhysicalPath = "$env:SystemDrive\inetpub\wwwroot"
                Ensure = "Present"
                State = "Started"
                BindingInfo     = MSFT_xWebBindingInformation 
                            { 
                            Protocol              = "HTTP" 
                            Port                  = 9090 
                            } 
            }

            # Make sure the WordPress Iis site is present
            xWebSite WordPressIisSite
            {
                Name = "WordPress"
                PhysicalPath = $BinaryFolder
                Ensure = "Present"
                State = "Started"
                DefaultPage = @("index.php") 
                DependsOn = @("[File]WordPressFolder","[xWebSite]DefaultIisSite")
            }

            $WordPressZip = Join-Path $PackageFolder "WordPress.zip"
            # Make sure the WordPress archive is in the package folder
            xRemoteFile WordPressArchive 
            {
                Uri = $DownloadUri
                DestinationPath = $WordPressZip
            }

            # Make sure the WordPress archive contents are in the WordPress root folder
            xArchive WordPress
            {
                Path = $WordPressZip
                Destination = $DestinationPath
                DependsOn = @("[xRemoteFile]WordPressArchive","[File]WordPressFolder")
            }
            
            # Make sure the WordPress configuration file is present
            File WordPressConfig
            {
                Contents = $Configuration
                DestinationPath = (Join-Path $BinaryFolder "wp-config.php")
                DependsOn = @("[xArchive]WordPress")
                MatchSource = $true
            }
}




configuration DeployContent
    {
        param (
            [Parameter(Mandatory=$true)] 
            [ValidateNotNullorEmpty()] 
            [PsCredential] $Credential 
            )

        Import-DscResource -ModuleName xRobocopy
        Node 'localhost'
        {
            xRobocopy Content
            {
                Source                = '\\server\share\ReleaseVersion'
                Destination           = 'C:\inetpub\wwwroot\sitename'
                Multithread           = $true
                Restartable           = $true
                PSRunAsCredential     = $Credential
            }
        }
    }
    $configData = @{
        AllNodes = @(
            @{
                NodeName                    = 'localhost';
                CertificateId               = 'Your Certificate thumbprint here'
                }
            )
        }
    DeployContent -ConfigurationData $configData -Credential (get-credential) -OutputPath 'c:\DSC'
    Start-DscConfiguration -Wait -Force -Verbose -Path 'c:\DSC'

    # Validate results
    # Get-ChildItem C:\inetpub\wwwroot\sitename
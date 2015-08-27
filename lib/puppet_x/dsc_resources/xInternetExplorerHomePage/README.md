[![Build status](https://ci.appveyor.com/api/projects/status/2f73cnimuofa6v20/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xinternetexplorerhomepage/branch/master)

# xInternetExplorerHomePage

The **xInternetExplorerHomePage** modules contains the **xInternetExplorerHomePage** resource, enabling you to set one or more IE home pages. 


## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).


## Resources

### xInternetExplorerHomePage

* **StartPage**: Specifies the home page of Internet Explorer.
* **SecondaryStartPages**: Specifies the secondary home pages of Internet Explorer.
* **Ensure**: Ensures that the IE home page is Present or Absent.


## Versions

### 1.0.0.0

* Initial release with the following resources 
    * xInternetExplorerHomePage


## Examples

### Set the Internet Explorer home page

```powershell
Configuration SetIEHomePage
{
    Param
    (
        #Target nodes to apply the configuration  
        [String[]]$NodeName = $env:COMPUTERNAME,  

        #Specifies the URL for the home page of Internet Explorer.
        [Parameter(Mandatory)]  
        [ValidateNotNullOrEmpty()]  
        [String]$StartPageURL,  

        #Specifies the URL for the secondary home pages of Internet Explorer.
        [Parameter()]   
        [String]$SecondaryStartPagesURL,  

        #Set the value as 'Present'/'Absent', it indicates the IE home page is configured/unconfigured.
        [Parameter(Mandatory)]  
        [ValidateSet('Present','Absent')]  
        [String]$SetEnsure
    )

    Import-DSCResource -ModuleName xInternetExplorerHomePage

    Node "localhost"
    {
        xInternetExplorerHomePage IEHomePage
        {
            StartPage = $StartPageURL
            SecondaryStartPages = $SecondaryStartPagesURL
            Ensure = $SetEnsure
        }
    }
}

SetIEHomePage -StartPageURL "www.bing.com" -SetEnsure 'Present'
Start-DscConfiguration -Path .\SetIEHomePage  -Wait -Force -Verbose
```

### Set the Secondary start page

```powershell 
Configuration SetIEHomePage
{
    Param
    (
        #Target nodes to apply the configuration  
        [String[]]$NodeName = $env:COMPUTERNAME,  

        #Specifies the URL for the home page of Internet Explorer.
        [Parameter(Mandatory)]  
        [ValidateNotNullOrEmpty()]  
        [String]$StartPageURL,  

        #Specifies the URL for the secondary home pages of Internet Explorer.
        [Parameter()]   
        [String]$SecondaryStartPagesURL,  

        #Set the value as 'Present'/'Absent', it indicates the IE home page is configured/unconfigured.
        [Parameter(Mandatory)]  
        [ValidateSet('Present','Absent')]  
        [String]$SetEnsure
    )

    Import-DSCResource -ModuleName xInternetExplorerHomePage

    Node "localhost"
    {
        xInternetExplorerHomePage IEHomePage
        {
            StartPage = $StartPageURL
            SecondaryStartPages = $SecondaryStartPagesURL
            Ensure = $SetEnsure
        }
    }
}

SetIEHomePage -StartPageURL "www.bing.com" -SecondaryStartPagesURL "www.google.com" -SetEnsure 'Present'
Start-DscConfiguration -Path .\SetIEHomePage  -Wait -Force -Verbose
```

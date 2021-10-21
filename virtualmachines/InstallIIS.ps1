#============================================================
#Install-IIS

function Test-Administrator
{
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

function InstallFeature($name) {

    # cmd /c "ocsetup $name /passive"
    # Add-WindowsFeature -Name $name

    Write-Host "Checking $($name) "
    $Installed = Dism /Online /Get-FeatureInfo /FeatureName:$name
    $Installed = $Installed | Select-String "State"
    $Installed = $Installed.Line.Split(':')[1].Trim()

    if($Installed -ne "Enabled") {
        Write-Host ""
        Write-Host "Installing $($name) "
        Dism /Online /Enable-Feature /FeatureName:$name /All /Quiet
    }

}

Write-Host ""
Write-Host "Enabling Web Server Role and installing required features "

$admin = Test-Administrator

if($admin) {

    InstallFeature IIS-WebServerRole
       
        InstallFeature IIS-WebServer
            InstallFeature IIS-CommonHttpFeatures
                InstallFeature IIS-DefaultDocument
                InstallFeature IIS-DirectoryBrowsing
                InstallFeature IIS-HttpErrors
                InstallFeature IIS-StaticContent
                
            InstallFeature IIS-HealthAndDiagnostics
                InstallFeature IIS-HttpLogging
                
            InstallFeature IIS-Performance
                InstallFeature IIS-HttpCompressionStatic
                
            InstallFeature IIS-Security
                InstallFeature IIS-RequestFiltering
                
            InstallFeature IIS-ApplicationDevelopment
               
                InstallFeature NetFx4Extended-ASPNET45
                InstallFeature IIS-NetFxExtensibility45
                InstallFeature IIS-ISAPIExtensions
                InstallFeature IIS-ISAPIFilter
                InstallFeature IIS-ASPNET
                InstallFeature IIS-ASPNET45
                InstallFeature NetFx4Extended-ASPNET45
                InstallFeature IIS-WebSockets
                
            InstallFeature IIS-WebServerManagementTools
                InstallFeature IIS-ManagementConsole

}


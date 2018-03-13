$site = "IIS:\Sites"
$setpolicy = "Read, Script,Execute"
Set-WebConfiguration //System.webServer/handlers -metadata overrideMode -value Allow -PSPath IIS:/ -verbose
Set-WebConfiguration -filter "/system.webServer/handlers/@AccessPolicy" -PSPath $site -value $setpolicy -verbose
Set-WebConfigurationProperty -filter /system.webServer/directoryBrowse -name enabled -PSPath 'IIS:\Sites\Default Web Site' -value true

Set-WebConfigurationProperty -filter system.webServer/security/authentication/anonymousAuthentication -name enabled -PSPath 'IIS:\Sites\' -value true
Set-WebConfiguration -pspath 'MACHINE/WEBROOT/APPHOST' -filter "system.webServer/security/isapiCgiRestriction" -value @{description='uk';path='C:\inetpub\wwwroot\uk\MedUpdate.dll';allowed='True'}
Set-Webconfiguration /system.applicationHost/applicationPools//@enable32BitAppOnWin64 -Value "true"
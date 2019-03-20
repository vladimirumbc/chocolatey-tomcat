$ErrorActionPreference = 'Stop'

$zipContentFolderName = "apache-tomcat-9.0.17"
$serviceBat = Split-Path -parent $MyInvocation.MyCommand.Definition |
    Join-Path -ChildPath $zipContentFolderName |
    Join-Path -ChildPath bin |
    Join-Path -ChildPath service

$ErrorActionPreference = 'Continue'
&$serviceBat remove
Write-Debug "`$? = $?"
Write-Debug "last exit code = $LastExitCode"
$ErrorActionPreference = 'Stop'

Uninstall-ChocolateyEnvironmentVariable -VariableName CATALINA_BASE
Uninstall-ChocolateyEnvironmentVariable -VariableName CATALINA_HOME

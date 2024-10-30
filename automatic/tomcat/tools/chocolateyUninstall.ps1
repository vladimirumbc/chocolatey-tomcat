$ErrorActionPreference = 'Stop'
$optionFile = Split-Path -Path $toolsDir -Parent | Join-Path -ChildPath options.json
$installOptions = Get-Content -Raw -Path $optionFile

$serviceBat = $installOptions.tomcatHome
    Join-Path -ChildPath bin |
    Join-Path -ChildPath service

Start-Process -FilePath $serviceBat -ArgumentList remove -Wait -NoNewWindow
Write-Debug "`$? = $?"
Write-Debug "last exit code = $LastExitCode"

Remove-Item -Path $installOptions.UnzipLocation -Recurse -Force -ErrorAction:Continue

Uninstall-ChocolateyEnvironmentVariable -VariableName CATALINA_BASE
Uninstall-ChocolateyEnvironmentVariable -VariableName CATALINA_HOME

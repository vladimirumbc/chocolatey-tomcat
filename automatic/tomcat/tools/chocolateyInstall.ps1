$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$serviceName = 'Tomcat10'

if (! (Test-ProcessAdminRights)) {
    Write-Error 'Admin right not granted; system service not installed.'
} elseif (! (Test-Path -Path env:JAVA_HOME) -or ! (Get-Command -Name javac)) {
    Write-Error 'Java not installed; system service not installed.'
}

$pp = Get-PackageParameters

$tomcatHome = if ($pp.Catalina_Home) {$pp.Catalina_Home} else {Join-Base -Path $toolsDir -ChildPath "apache-tomcat-10"}

$packageArgs = @{
    PackageName = $env:ChocolateyPackageName
    Url64 = 'https://choco.ad.umbc.edu/artifacts/tomcat10/10.1.31/apache-tomcat-10.1.31-windows-x64.zip'
    UnzipLocation = $tomcatHome
    SpecificFolder = 'apache-tomcat-10.1.31'
}

Install-ChocolateyZipPackage @packageArgs

$tomcatBase = if ($pp.Catalina_Base) {$pp.Catalina_Base} else {Join-Path -Path $env:ProgramData -ChildPath 'apache-tomcat-10'}
Install-ChocolateyEnvironmentVariable -VariableName CATALINA_BASE -VariableValue $tomcatBase -Scope 'Machine'
Install-ChocolateyEnvironmentVariable -VariableName CATALINA_HOME -VariableValue $tomcatHome -Scope 'Machine'

if (Test-Path -Path $tomcatBase -ErrorAction SilentlyContinue) {
    Write-Debug "using configuration at $tomcatBase."
    foreach ($folder in 'conf', 'logs', 'temp', 'webapps', 'work') {
        Remove-Item -Recurse -Path "$tomcatHome\$folder"
    }
} else {
    Write-Verbose 'initializing configurations...'
    New-Item -Path $tomcatBase -ItemType directory
    foreach ($folder in 'conf', 'logs', 'temp', 'webapps', 'work') {
        Move-Item -Path "$tomcatHome\$folder" -Destination $tomcatBase
    }
}

$service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue
if ($service.Length -gt 0) {
    &"$tomcatHome\bin\service" uninstall
}

&"$tomcatHome\bin\service" install
Write-Debug "`$? = $?"
Write-Debug "last exit code = $LastExitCode"

$packageArgs['serviceName'] = $serviceName
$packageArgs['Catalina_Base'] = $tomcatBase
$optionFile = Split-Path -Path $toolsDir -Parent | Join-Path -ChildPath options.json
$packageArgs | ConvertTo-Json | Out-File -FilePath $optionFile -Force

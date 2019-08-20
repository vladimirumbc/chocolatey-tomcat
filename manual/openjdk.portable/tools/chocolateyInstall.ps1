$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$pkgArgs = @{
    packageName = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url64bit = "https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_windows-x64_bin.zip"
    checksum64 = 'cf39490fe042dba1b61d6e9a395095279a69e70086c8c8d5466d9926d80976d8'
    checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @pkgArgs

if (Test-ProcessAdminRights) {
    $pathType = 'Machine'
} else {
    $pathType = 'User'
}
$envArgs = @{
    variableName = 'JAVA_HOME'
    variableValue = "$toolsDir\jdk-$env:ChocolateyPackageVersion"
    variableType = $pathType
}
Install-ChocolateyEnvironmentVariable @envArgs

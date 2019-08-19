$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$pkgArgs = @{
    packageName = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url64bit = "https://download.java.net/java/GA/jdk11/7/GPL/openjdk-11.0.2_windows-x64_bin.zip"
    checksum64 = '74b13684729a249d32fd955fd1de2bec22e627f6a6a5894ca74f88c945c95f55'
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

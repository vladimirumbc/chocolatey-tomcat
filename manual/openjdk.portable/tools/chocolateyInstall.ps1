$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$pkgArgs = @{
    packageName = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url64bit = "https://download.java.net/java/GA/jdk11/13/GPL/openjdk-${env:ChocolateyPackageVersion}_windows-x64_bin.zip"
    checksum64 = '289dd06e06c2cbd5e191f2d227c9338e88b6963fd0c75bceb9be48f0394ede21'
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

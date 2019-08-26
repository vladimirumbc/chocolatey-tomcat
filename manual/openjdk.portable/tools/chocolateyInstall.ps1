$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$pkgArgs = @{
    packageName = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url64bit = "https://download.java.net/java/GA/jdk12/33/GPL/openjdk-12_windows-x64_bin.zip"
    checksum64 = '35a8d018f420fb05fe7c2aa9933122896ca50bd23dbd373e90d8e2f3897c4e92'
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
    variableValue = "$toolsDir\jdk-12"
    variableType = $pathType
}
Install-ChocolateyEnvironmentVariable @envArgs

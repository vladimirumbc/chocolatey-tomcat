$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$pkgArgs = @{
    packageName = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url64bit = 'https://download.java.net/java/GA/jdk12.0.1/69cfe15208a647278a19ef0990eea691/12/GPL/openjdk-12.0.1_windows-x64_bin.zip'
    checksum64 = 'fc7d9eee3c09ea6548b00ca25dbf34a348b3942c815405a1428e0bfef268d08d'
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
    variableValue = "$toolsDir\jdk-12.0.1"
    variableType = $pathType
}
Install-ChocolateyEnvironmentVariable @envArgs

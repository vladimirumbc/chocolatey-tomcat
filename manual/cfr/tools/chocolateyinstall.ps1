$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$jarPath = Join-Path -Path $toolsDir -ChildPath 'cfr.jar'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    fileFullPath  = $jarPath
    url           = "http://www.benf.org/other/cfr/cfr_$($env:ChocolateyPackageVersion.Replace('.', '_')).jar"
    checksum      = '3d6adb020c842cc8cb4198e7b38f256363987ba86fdb0272c1a7dcd08c0bbd26'
    checksumType  = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

$javaCmd = Get-Command -Name java
if ($javaCmd -eq $null -or $javaCmd.CommandType -ne 'Application')
{
    throw 'Unexpected Java location'
}
Install-Binfile -Name $env:ChocolateyPackageName -Path $javaCmd.Definition -Command "`"-jar $jarPath`""

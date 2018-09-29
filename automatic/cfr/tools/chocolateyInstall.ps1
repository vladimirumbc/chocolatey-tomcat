$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$jarPath = Join-Path -Path $toolsDir -ChildPath 'cfr.jar'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    fileFullPath  = $jarPath
    url           = 'http://www.benf.org/other/cfr/cfr_0_133.jar'
    checksum      = '0c4fb231158dda6d52f9edc51408c7bafd9437ee3e871715193cd86220a9f440'
    checksumType  = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

[array]$javaCmds = Get-Command -Name java
if ($javaCmds[0].CommandType -ne 'Application')
{
    throw 'Unexpected Java location'
}
Install-Binfile -Name $env:ChocolateyPackageName -Path $javaCmds[0].Definition -Command "`"-jar $jarPath`""

$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$jarPath = Join-Path -Path $toolsDir -ChildPath 'cfr.jar'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    fileFullPath  = $jarPath
    url           = 'http://www.benf.org/other/cfr/cfr_0_132.jar'
    checksum      = 'e10b1667835cf5b73f09cf37eb122192ce29583c29f5c3a4e134a43e7669f5ba'
    checksumType  = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

[array]$javaCmds = Get-Command -Name java
if ($javaCmds[0] -eq $null -or $javaCmds[0].CommandType -ne 'Application')
{
    throw 'Unexpected Java location'
}
Install-Binfile -Name $env:ChocolateyPackageName -Path $javaCmds[0].Definition -Command "`"-jar $jarPath`""

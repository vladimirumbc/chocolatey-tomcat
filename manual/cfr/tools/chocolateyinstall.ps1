$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$jarPath = Join-Path -Path $toolsDir -ChildPath 'cfr.jar'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    fileFullPath  = $jarPath
    url           = "http://www.benf.org/other/cfr/cfr_$($env:ChocolateyPackageVersion.Replace('.', '_')).jar"
    checksum      = 'b66a1e59891a2585885b171b4ec6fcc0e20f0d419e90a153e5c01540bb1cc67f'
    checksumType  = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

$javaCmd = Get-Command -Name java
if ($javaCmd -eq $null -or $javaCmd.CommandType -ne 'Application')
{
    throw 'Unexpected Java location'
}
Install-Binfile -Name $env:ChocolateyPackageName -Path $javaCmd.Definition -Command "`"-jar $jarPath`""

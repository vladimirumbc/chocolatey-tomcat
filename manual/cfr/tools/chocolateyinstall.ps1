$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$jarPath = Join-Path -Path $toolsDir -ChildPath 'cfr.jar'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    fileFullPath  = $jarPath
    url           = "http://www.benf.org/other/cfr/cfr_$($env:ChocolateyPackageVersion.Replace('.', '_')).jar"
    checksum      = '4A68B0FE1A4E1EB0061EED4387C3F00FE406C03325AF54E68F803204EE4B7B26'
    checksumType  = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

$javaCmd = Get-Command -Name java
if ($javaCmd -eq $null -or $javaCmd.CommandType -ne 'Application')
{
    throw 'Unexpected Java location'
}
Install-Binfile -Name $env:ChocolateyPackageName -Path $javaCmd.Definition -Command "`"-jar $jarPath`""

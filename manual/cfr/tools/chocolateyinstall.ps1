$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$jarPath = Join-Path -Path $toolsDir -ChildPath 'cfr.jar'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    fileFullPath  = $jarPath
    url           = "http://www.benf.org/other/cfr/cfr_$($env:ChocolateyPackageVersion.Replace('.', '_')).jar"
    checksum      = '8aab66c335c2ba34844d95f45262f9a4706fff31b50e8a24dacbb3745e6ba9a9'
    checksumType  = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

$javaCmd = Get-Command -Name java
if ($javaCmd -eq $null -or $javaCmd.CommandType -ne 'Application')
{
    throw 'Unexpected Java location'
}
Install-Binfile -Name $env:ChocolateyPackageName -Path $javaCmd.Definition -Command "`"-jar $jarPath`""

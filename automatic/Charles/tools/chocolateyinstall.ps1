$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'Charles'
  fileType      = 'msi'
  url           = '{{Url32}}'
  url64bit      = '{{Url64}}'

  #MSI
  silentArgs    = '/qn /norestart'
  validExitCodes= @(0, 3010, 1641)

  checksum      = '{{Checksum32}}'
  checksumType  = 'sha256'
  checksum64    = '{{Checksum64}}'
  checksumType64= 'sha256'
}

Install-ChocolateyPackage @packageArgs

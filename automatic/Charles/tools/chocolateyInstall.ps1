$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'Charles'
  fileType      = 'msi'
  url           = 'https://www.charlesproxy.com/assets/release/3.12.3/charles-proxy-3.12.3-win32.msi'
  url64bit      = 'https://www.charlesproxy.com/assets/release/3.12.3/charles-proxy-3.12.3-win64.msi'

  #MSI
  silentArgs    = '/qn /norestart'
  validExitCodes= @(0, 3010, 1641)

  checksum      = 'a65eb8ddbfdc925622c01bfea735464423c849d26c441f8425fdff97005f559c'
  checksumType  = 'sha256'
  checksum64    = '7022d4c693605407a011f8364c763fcffd20f511e58543a6a5a3566dae54dfcc'
  checksumType64= 'sha256'
}

Install-ChocolateyPackage @packageArgs

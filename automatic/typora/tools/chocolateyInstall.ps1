$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-1201.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-1201.exe'

  checksum       = '82cb3252a12517737712ef5ef4b6a3db8d8c5458ab36b187696577568d09e1ea'
  checksumType   = 'sha256'
  checksum64     = 'd5ef9567401afc1d2d6fad1194a4e0ba375298133cc67b3bdc15cf10f4a797d5'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

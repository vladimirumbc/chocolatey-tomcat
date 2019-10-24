$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-1022.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-1022.exe'

  checksum       = 'd0a7a7c170ea3cec186f2c0270b11121b7184765d24da9b29ff8cf62dc79b542'
  checksumType   = 'sha256'
  checksum64     = 'c899f10f6f8c09929bb4b7d318865db25daf3e4188740413cda233d64c563a04'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

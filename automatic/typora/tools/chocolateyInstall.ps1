$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-0620.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-0620.exe'

  checksum       = '1399ab846a106ef95265cbf14da8aa4fb52961be883f87b635a47dd48388e370'
  checksumType   = 'sha256'
  checksum64     = 'eb9aded870b2af73c2bbff88339b7fbf4e73ade4f2a80dab1f1edab9d34ef64b'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

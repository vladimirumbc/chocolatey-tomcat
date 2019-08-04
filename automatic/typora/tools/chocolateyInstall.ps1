$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-0804.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-0804.exe'

  checksum       = '0141f36ec6e88d9cd2150d06ca95ba40b0634d828f29fd4b95114a8972c3abaa'
  checksumType   = 'sha256'
  checksum64     = 'bf6581e9225f5bdc5debae5f1d45f34bbc01e467f6dfb5197360bb5299f1b876'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

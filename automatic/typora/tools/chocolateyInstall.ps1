$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-0902.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-0902.exe'

  checksum       = '8907b45f01fdacd00e8b56c7e360bcac6d8ca5d78f502a5e988b20d2e8aa0ee2'
  checksumType   = 'sha256'
  checksum64     = '67081eb7cdb8f1f1d269d2d20012077b99d8c8181ab827bdf98ba4e9cba877de'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

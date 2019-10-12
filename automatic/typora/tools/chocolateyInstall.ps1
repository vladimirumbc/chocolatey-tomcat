$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-1011.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-1011.exe'

  checksum       = '14b9c0077293de4b16a68a4dfb8839dfcfb7c8f926a6e6cf13cdba765bd75d57'
  checksumType   = 'sha256'
  checksum64     = '87a1e56fc3a222580d2aa4e4e1a6b77d76bb26809688e97a22067b69353ddf05'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

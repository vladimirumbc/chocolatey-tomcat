$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-0110.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-0110.exe'

  checksum       = '7caa2968175df186f5e9ee08d99424a88c9e421632bd6998b21bc3b670959d9c'
  checksumType   = 'sha256'
  checksum64     = ''
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-0403.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-0403.exe'

  checksum       = '4a5ae49db458b7ab0d4992ab61d78464dd5c1918288d965ea408b3227c713843'
  checksumType   = 'sha256'
  checksum64     = '861d24f81fc0557f06c4c2f28af8c2f324179dfbb068712265f15da26e26e653'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

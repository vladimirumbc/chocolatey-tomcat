$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-0314.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-0314.exe'

  checksum       = '5f3c60d1d3348674c0d2249a523dd2686723a01a66a8b1edfb91b5cdc0e71f68'
  checksumType   = 'sha256'
  checksum64     = 'c4e94663e37448fad71c820bcd20fbfcf434fe18cae86cda22569f2b9ba2240e'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

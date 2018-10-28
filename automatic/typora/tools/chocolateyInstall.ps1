$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = "https://typora.io/windows/typora-update-ia32-$date.exe"
  url64bit       = "https://typora.io/windows/typora-update-x64-$date.exe"

  checksum       = '7b78bcff921e3706af69fcca05b71f71f6dd3eaab95c7d82e89f35a6fc1bb9ef'
  checksumType   = 'sha256'
  checksum64     = '6a9126d820ac3840bc57340e346b0e0f30e5d5a8324b60d3cf1207872f0704d6'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

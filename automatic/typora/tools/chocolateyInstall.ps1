$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = "https://typora.io/windows/typora-update-ia32-1024.exe"
  url64bit       = "https://typora.io/windows/typora-update-x64-1024.exe"

  checksum       = '3590569b4346d93947b844dd5402b7d24c777ef2f28f5722877d616d1118f514'
  checksumType   = 'sha256'
  checksum64     = '02dadb5ab70217d12be64a524162564e8f524d07e2036093adcca21c218a956d'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

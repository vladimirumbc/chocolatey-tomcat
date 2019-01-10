$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-0109.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-0109.exe'

  checksum       = 'ec3058a414cb87c44f27a01393ea3025f7693813983af7fc301c921fa4be0022'
  checksumType   = 'sha256'
  checksum64     = ''
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

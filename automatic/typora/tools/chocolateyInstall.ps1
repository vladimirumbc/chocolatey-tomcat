$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-0126.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-0126.exe'

  checksum       = 'a9a17cc8cc115db1fb776af2066721f6f62340009145fdbc81562be67ca38b99'
  checksumType   = 'sha256'
  checksum64     = '48890ccf2ea6a24e42646dabf91dfd631b99af5050ff2f05dc98b844955e6d26'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

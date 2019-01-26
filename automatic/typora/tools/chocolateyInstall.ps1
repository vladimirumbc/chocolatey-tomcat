$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-0125.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-0125.exe'

  checksum       = 'bdd789bb5fea8a76ac74f617abde36bc5c4115bc69adfdcde527e220ec253492'
  checksumType   = 'sha256'
  checksum64     = '14ce88ce45c7ab5e797b4d1ab3db954ea60f2a904a51dd9f003145d2c8b3cea6'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

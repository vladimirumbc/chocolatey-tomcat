$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-0320.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-0320.exe'

  checksum       = '69256ae29067af06d4efed9ca6b6ae3610db195a6a1041f05aaecb718f5226c2'
  checksumType   = 'sha256'
  checksum64     = '6d941857d1acf78ef8ab5e565df48a0b74399ebe742cf515411a59eacb4e9993'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

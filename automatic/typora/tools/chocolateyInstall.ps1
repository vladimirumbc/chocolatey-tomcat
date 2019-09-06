$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-0905.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-0905.exe'

  checksum       = '1075ca109f83d5e79c489df83b4104d2ba26f601f9dbf0e361ee7cbb56a702a5'
  checksumType   = 'sha256'
  checksum64     = 'ffdbaa2d82d72b3c68379e63ed49be132fb7dc497e4c15d5c0adc6f6e5639f47'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

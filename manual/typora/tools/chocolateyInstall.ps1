$ErrorActionPreference = 'Stop';

$date = '0502'
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = "https://typora.io/windows/typora-update-ia32-$date.exe"
  url64bit       = "https://typora.io/windows/typora-update-x64-$date.exe"

  checksum       = '212416bfa7bcaffe3cc73364a85df1a8ee31e54e224b8a651ece1c3c5d3fef89'
  checksumType   = 'sha256'
  checksum64     = '8edc7c5e8d3834a696bcce07dde35f7fe36c8f895a486aed82bf588ff757161a'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

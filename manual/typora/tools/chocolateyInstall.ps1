$ErrorActionPreference = 'Stop';

$date = '0823'
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = "https://typora.io/windows/typora-update-ia32-$date.exe"
  url64bit       = "https://typora.io/windows/typora-update-x64-$date.exe"

  checksum       = 'd5ceda4874ad44845663699db7967d9c645e9e852366a3a7f1874282a19212a0'
  checksumType   = 'sha256'
  checksum64     = 'fb18594fcfeedc75e63497d736203c27bba5fac8a1d91261e018b6c16ded2878'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

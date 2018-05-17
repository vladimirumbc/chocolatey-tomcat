$ErrorActionPreference = 'Stop';

$date = '0503'
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = "https://typora.io/windows/typora-update-ia32-$date.exe"
  url64bit       = "https://typora.io/windows/typora-update-x64-$date.exe"

  checksum       = '619E0F127E9D40C06952FDF84869B8A53882945CE34BE4C77443DA38E150E656'
  checksumType   = 'sha256'
  checksum64     = '6F62C7119C7B23739516425DB40D77C3142FB7448DEC89A6AE1A000F5E689220'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

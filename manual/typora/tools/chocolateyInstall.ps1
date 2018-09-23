$ErrorActionPreference = 'Stop';

$date = '0831'
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = "https://typora.io/windows/typora-update-ia32-$date.exe"
  url64bit       = "https://typora.io/windows/typora-update-x64-$date.exe"

  checksum       = '1530fb4c57416b2685ccb814f3d779d20765a6df2a6bcaad1825508375290e2c'
  checksumType   = 'sha256'
  checksum64     = '962457f5177389b1a0a4fa09d25cd65102df13f504abbd6937b621e8295ef5a6'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$ErrorActionPreference = 'Stop';

$date = '0527'
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = "https://typora.io/windows/typora-update-ia32-$date.exe"
  url64bit       = "https://typora.io/windows/typora-update-x64-$date.exe"

  checksum       = 'd00ab9d7101581354ab056202344a9f8845a4f43237ea84c276df178158f7e16'
  checksumType   = 'sha256'
  checksum64     = 'f39497c0cf1ab1e45c9c276368a4dce1d9d22de672407ad4124de4746c8fca21'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

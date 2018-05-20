$ErrorActionPreference = 'Stop';

$date = '0515'
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = "https://typora.io/windows/typora-update-ia32-$date.exe"
  url64bit       = "https://typora.io/windows/typora-update-x64-$date.exe"

  checksum       = 'c7b22c0b9627f78e0e4d2be6170ee6081651260bffd014939b8cbee09bfb4563'
  checksumType   = 'sha256'
  checksum64     = 'd825ebe59d989e53aa4d56cb61df36148c7708fe47c38a068d5fd715c1a3342c'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

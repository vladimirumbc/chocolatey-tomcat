$ErrorActionPreference = 'Stop';

$date = '0601'
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = "https://typora.io/windows/typora-update-ia32-$date.exe"
  url64bit       = "https://typora.io/windows/typora-update-x64-$date.exe"

  checksum       = '56e09985eaeeddc072751598eb295664b659a24639dc410aba85bb5b41a8b055'
  checksumType   = 'sha256'
  checksum64     = '942e90f14e1e7914f2061cf9ab41edda6e5a9afa7146ae0171c4f1887c7bea93'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

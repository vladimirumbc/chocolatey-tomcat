$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-0217.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-0217.exe'

  checksum       = '6f8219f443b1fb38b468d4ed36073acefaceaf24a2f4af3e14e9815a99c9b76a'
  checksumType   = 'sha256'
  checksum64     = '978ca0637c866c350be07e495c3986cd202708941286f298bb9b6cf03dd28c3c'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

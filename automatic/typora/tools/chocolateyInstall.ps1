$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-0420.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-0420.exe'

  checksum       = '09f13fa0d201091eb3648c861ca3e595ea37dfb059c785b68ba7980105013cfa'
  checksumType   = 'sha256'
  checksum64     = 'd8842edb71477d88a7085201f8e149b8217800cd5dff244df6174d80be28b56a'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

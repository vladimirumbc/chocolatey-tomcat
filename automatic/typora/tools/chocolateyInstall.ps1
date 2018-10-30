$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-1027.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-1027.exe'

  checksum       = '3ee3555f6bd54bdde9b015858de1746b02ae99e34662db8f1e54967862a93d3f'
  checksumType   = 'sha256'
  checksum64     = ''
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

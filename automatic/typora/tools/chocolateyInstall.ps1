$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-1227.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-1227.exe'

  checksum       = '91781290143089cd67886b2957b5bcf99ae0f17317ef61739203ab0d6c70cb36'
  checksumType   = 'sha256'
  checksum64     = '25dd39ea79e797037c1f263999efc1eb31c088ffb975fc5b1c792c3e0c1f7644'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

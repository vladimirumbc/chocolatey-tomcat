$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-0419.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-0419.exe'

  checksum       = 'f1e44d4e4205f69a75bb54f17b4ee0fd5dd3affe80ae18df1235721142141725'
  checksumType   = 'sha256'
  checksum64     = 'c6c3ae07eb91b71f0c0bdb8d38640a129d0cd09100b529c8e056835c984b8be7'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

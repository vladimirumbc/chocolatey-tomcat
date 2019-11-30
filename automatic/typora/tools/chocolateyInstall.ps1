$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-1130.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-1130.exe'

  checksum       = 'a7925b92ba055599d29a0fc21cd9e864e49150af2a7867092285b92188695cce'
  checksumType   = 'sha256'
  checksum64     = 'a0524e232ca8c274ebb87d9df020d31617551d74955f27dc3a4782dd31d05177'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

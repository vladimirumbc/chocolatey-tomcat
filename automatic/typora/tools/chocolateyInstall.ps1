$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-0621.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-0621.exe'

  checksum       = '4b240a7835bec6ded993e0db95482bffbf0244e5428c17c7b3a9ad6c5bf712c2'
  checksumType   = 'sha256'
  checksum64     = '7da4b26c2656bef322e479d211b4fada9000251d0f9f4cdcb65207ec736848b2'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

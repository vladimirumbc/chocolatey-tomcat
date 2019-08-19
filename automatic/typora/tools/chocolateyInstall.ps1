$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://typora.io/windows/typora-update-ia32-0818.exe'
  url64bit       = 'https://typora.io/windows/typora-update-x64-0818.exe'

  checksum       = 'af8f7bf9a68c9043a92094016156756127d65440b892685c475f608acc913f65'
  checksumType   = 'sha256'
  checksum64     = 'e0f37e509b89164fa191bb450578cd8df348fb9c0e5996c7b728188913314808'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

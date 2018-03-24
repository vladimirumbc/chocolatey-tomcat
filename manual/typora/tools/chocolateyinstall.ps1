$ErrorActionPreference = 'Stop';

$packageName= 'typora'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://typora.io/windows/typora-setup-ia32.exe'
$url64      = 'https://typora.io/windows/typora-setup-x64.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'typora*'

  checksum      = '3325C21C361AF64DDACB2416BE46B107441C28F7AFEBF2DFB0FCB45C1B40E489'
  checksumType  = 'sha256'
  checksum64    = '926826D4BC0A04EF1D9E99A03C7E7E154B32AA0AA38204CBB13F0F17454344C8'
  checksumType64= 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

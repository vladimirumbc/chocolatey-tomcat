$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$folder = 'kse-541'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/kaikramer/keystore-explorer/releases/download/v5.4.1/kse-541.zip'
  checksum      = '9a112b8b71322088cd62c40a84e234497da0cecd8b4e02f68d2799355d69d35d'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

if (Test-ProcessAdminRights)
{
    $specialFolder = [Environment+SpecialFolder]::CommonPrograms
}
else
{
    $specialFolder = [Environment+SpecialFolder]::Programs
}

$exePath = Join-Path -Path $toolsDir -ChildPath $folder |  Join-Path -ChildPath 'kse.exe'
$linkPath = [Environment]::GetFolderPath($specialFolder) | Join-Path -ChildPath 'KeyStore Explorer.lnk'
Install-ChocolateyShortcut -ShortcutFilePath $linkPath -TargetPath $exePath

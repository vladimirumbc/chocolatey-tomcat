$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$folder = ''

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = ''
  checksum      = '20420dfdb5af89a73399aba9a6d41fbaead7df8d0d29577a1216fd6bfadfc53f'
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

$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$folder = 'kse-542'

$packageArgs = @{
    packageName = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url = 'https://github.com/kaikramer/keystore-explorer/releases/download/v5.4.2/kse-542.zip'
    checksum = '5ff6c4081483f360b600662f14b99bd050e72f279110bdc216608273e3a89446'
    checksumType = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

if (Test-ProcessAdminRights) {
    $specialFolder = [Environment+SpecialFolder]::CommonPrograms
} else {
    $specialFolder = [Environment+SpecialFolder]::Programs
}

$exePath = Join-Path -Path $toolsDir -ChildPath $folder |  Join-Path -ChildPath 'kse.exe'
$linkPath = [Environment]::GetFolderPath($specialFolder) | Join-Path -ChildPath 'KeyStore Explorer.lnk'
Install-ChocolateyShortcut -ShortcutFilePath $linkPath -TargetPath $exePath

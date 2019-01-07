$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = $toolsDir
  fileFullPath = Join-Path -Path $toolsDir -ChildPath 'thumbs_viewer_32.zip'
  fileFullPath64 = Join-Path -Path $toolsDir -ChildPath 'thumbs_viewer_64.zip'
}
Get-ChocolateyUnzip @packageArgs

$exePath = Join-Path -Path $toolsDir -ChildPath thumbs_viewer.exe
if (Test-ProcessAdminRights) {
    $specialFolder = [Environment+SpecialFolder]::CommonPrograms
} else {
    $specialFolder = [Environment+SpecialFolder]::Programs
}
$linkPath = [Environment]::GetFolderPath($specialFolder) | Join-Path -ChildPath 'Thumbs Viewer.lnk'
Install-ChocolateyShortcut -ShortcutFilePath $linkPath -TargetPath $exePath

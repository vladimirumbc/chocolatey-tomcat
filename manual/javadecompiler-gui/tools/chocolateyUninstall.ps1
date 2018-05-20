$packageArgs = @{
  packageName = 'javadecompiler-gui'
  zipFileName = 'jd-gui-windows-1.4.0.zip'
}

if (Test-ProcessAdminRights)
{
    $specialFolder = [Environment+SpecialFolder]::CommonPrograms
}
else
{
    $specialFolder = [Environment+SpecialFolder]::Programs
}
$menuPrograms = [environment]::GetFolderPath($specialFolder)
$shortcutFilePath = "$menuPrograms\Java Decompiler.lnk"

UnInstall-ChocolateyZipPackage @packageArgs
If (Test-Path $shortcutFilePath) {
  Remove-Item $shortcutFilePath
}

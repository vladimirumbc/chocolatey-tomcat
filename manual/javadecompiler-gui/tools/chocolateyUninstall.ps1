if (Test-ProcessAdminRights)
{
    $specialFolder = [Environment+SpecialFolder]::CommonPrograms
}
else
{
    $specialFolder = [Environment+SpecialFolder]::Programs
}

$menuPrograms = [Environment]::GetFolderPath($specialFolder)
$shortcutFilePath = "$menuPrograms\Java Decompiler.lnk"

If (Test-Path $shortcutFilePath) {
  Remove-Item $shortcutFilePath
}

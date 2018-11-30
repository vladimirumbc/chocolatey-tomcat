Uninstall-BinFile -Name $env:ChocolateyPackageName

if (Test-ProcessAdminRights) {
  $specialFolder = [Environment+SpecialFolder]::CommonPrograms
} else {
  $specialFolder = [Environment+SpecialFolder]::Programs
}
$linkPath = [Environment]::GetFolderPath($specialFolder) | Join-Path -ChildPath 'ClassyShark.lnk' | Remove-Item

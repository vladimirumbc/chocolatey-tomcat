$ErrorActionPreference = 'Stop'; # stop on all errors

Uninstall-BinFile -Name jadx
Uninstall-BinFile -Name jadx-gui

if (Test-ProcessAdminRights)
{
    $specialFolder = [Environment+SpecialFolder]::CommonPrograms
}
else
{
    $specialFolder = [Environment+SpecialFolder]::Programs
}
[Environment]::GetFolderPath($specialFolder) | Join-Path -ChildPath 'JADX GUI.lnk' | Remove-Item

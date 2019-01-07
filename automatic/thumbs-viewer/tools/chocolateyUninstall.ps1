if (Test-ProcessAdminRights) {
    $specialFolder = [Environment+SpecialFolder]::CommonPrograms
} else {
    $specialFolder = [Environment+SpecialFolder]::Programs
}
[Environment]::GetFolderPath($specialFolder) | Join-Path -ChildPath 'Thumbs Viewer.lnk' | Remove-Item

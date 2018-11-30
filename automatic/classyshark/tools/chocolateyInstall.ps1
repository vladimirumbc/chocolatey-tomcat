$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$jarPath = Join-Path -Path $toolsDir -ChildPath ClassyShark.jar

$javaCmd = Get-Command -Name java
if ($javaCmd.CommandType -ne 'Application') {
    throw 'Unexpected Java location'
}
Install-Binfile -Name $env:ChocolateyPackageName -Path $javaCmd.Definition -Command "`"-jar $jarPath`""

if (Test-ProcessAdminRights) {
    $specialFolder = [Environment+SpecialFolder]::CommonPrograms
} else {
    $specialFolder = [Environment+SpecialFolder]::Programs
}
$options = @{
    shortcutFilePath = [Environment]::GetFolderPath($specialFolder) | Join-Path -ChildPath ClassyShark.lnk
    targetPath = $jarPath
    workingDirectory = '%AppData%'
    iconLocation = Join-Path -Path $toolsDir -ChildPath ClassyShark.ico
}
Install-ChocolateyShortcut @options

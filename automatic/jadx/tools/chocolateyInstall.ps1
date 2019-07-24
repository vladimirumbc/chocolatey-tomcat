$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

# polyfill
if (! (Get-Command -Name New-TemporaryFile -ErrorAction SilentlyContinue)) {
    function New-TemporaryFile {
        return [IO.Path]::GetTempFileName()
    }
}

# check Java 64-bit
$tempFile = New-TemporaryFile
Start-Process -FilePath 'java.exe' -RedirectStandardError $tempFile -ArgumentList '-version' -NoNewWindow -Wait
if (! (Select-String -Path $tempFile -Pattern 64-Bit)) {
    Remove-Item -Path $tempFile
    throw 'require 64-bit Java'
}
Remove-Item -Path $tempFile

$filename = "jadx-1.0.0.zip"
$packageArgs = @{
    packageName = $env:ChocolateyPackageName
    destination = $toolsDir
    fileFullPath64 = Join-Path -Path $toolsDir -ChildPath $filename
}
Get-ChocolateyUnzip @packageArgs

$binPath = Join-Path -Path $toolsDir -ChildPath bin
$jadx = Join-Path -Path $binPath -ChildPath jadx.bat
$jadxGui = Join-Path -Path $binPath -ChildPath jadx-gui.bat
Install-BinFile -Name jadx -Path $jadx
Install-BinFile -Name jadx-gui -Path $jadxGui

if (Test-ProcessAdminRights) {
    $specialFolder = [Environment+SpecialFolder]::CommonPrograms
} else {
    $specialFolder = [Environment+SpecialFolder]::Programs
}
$linkPath = [Environment]::GetFolderPath($specialFolder) | Join-Path -ChildPath 'JADX GUI.lnk'
Install-ChocolateyShortcut -ShortcutFilePath $linkPath -TargetPath $jadxGui

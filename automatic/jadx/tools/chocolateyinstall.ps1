$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

# polyfill
if (! (Get-Command -Name New-TemporaryFile -ErrorAction SilentlyContinue))
{
    function New-TemporaryFile
    {
        return [IO.Path]::GetTempFileName()
    }
}

# check Java 64-bit
$tempFile = New-TemporaryFile
Start-Process -FilePath 'java.exe' -RedirectStandardError $tempFile -ArgumentList '-version' -NoNewWindow -Wait
if (! (Select-String -Path $tempFile -Pattern 64-Bit))
{
    Remove-Item -Path $tempFile
    throw 'require 64-bit Java'
}
Remove-Item -Path $tempFile

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/skylot/jadx/releases/download/v0.8.0/jadx-0.8.0.zip'
  checksum      = 'dd02d0dc44a2beb6de5203297875c835332d44bf294db417c20e7bdb267f0c0f'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$binPath = Join-Path -Path $toolsDir -ChildPath bin
$jadx = Join-Path -Path $binPath -ChildPath jadx.bat
$jadxGui = Join-Path -Path $binPath -ChildPath jadx-gui.bat
Install-BinFile -Name jadx -Path $jadx
Install-BinFile -Name jadx-gui -Path $jadxGui

if (Test-ProcessAdminRights)
{
    $specialFolder = [Environment+SpecialFolder]::CommonPrograms
}
else
{
    $specialFolder = [Environment+SpecialFolder]::Programs
}
$linkPath = [Environment]::GetFolderPath($specialFolder) | Join-Path -ChildPath 'JADX GUI.lnk'
Install-ChocolateyShortcut -ShortcutFilePath $linkPath -TargetPath $jadxGui

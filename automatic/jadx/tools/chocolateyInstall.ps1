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
  url           = 'https://github.com/skylot/jadx/releases/download/v0.9.0/jadx-0.9.0.zip'
  checksum      = 'd2f49df069df8bffc20651b182c5eaa483a7d12abc00b2099bfd836fdd2bd103'
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

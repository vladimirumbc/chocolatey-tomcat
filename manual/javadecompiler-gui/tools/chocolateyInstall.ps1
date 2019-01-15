$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'javadecompiler-gui'
  url           = 'https://github.com/java-decompiler/jd-gui/releases/download/v1.4.0/jd-gui-windows-1.4.0.zip'
  checksum      = '4cf79cbae4b355cf2b9cd332462491a8'
  checksumType  = 'md5'
  unzipLocation = $toolsDir
}

if (Test-ProcessAdminRights)
{
    $specialFolder = [Environment+SpecialFolder]::CommonPrograms
}
else
{
    $specialFolder = [Environment+SpecialFolder]::Programs
}
$menuPrograms = [Environment]::GetFolderPath($specialFolder)
$shotrcutArgs = @{
  shortcutFilePath = "$menuPrograms\Java Decompiler.lnk"
  targetPath       = "$toolsDir\jd-gui-windows-1.4.0\jd-gui.exe"
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut @shotrcutArgs

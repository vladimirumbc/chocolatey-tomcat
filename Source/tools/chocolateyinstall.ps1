$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'Charles' # arbitrary name for the package, used in messages
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.charlesproxy.com/assets/release/3.11.2/charles-proxy-3.11.2-win32.msi' # download url
$url64      = 'https://www.charlesproxy.com/assets/release/3.11.2/charles-proxy-3.11.2-win64.msi' # 64bit URL here or remove - if installer is both, use $url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi' #only one of these: exe, msi, msu
  url           = $url
  url64bit      = $url64

  #MSI
  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'Charles*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = ''
  checksumType  = 'md5' #default is md5, can also be sha1
  checksum64    = ''
  checksumType64= 'md5' #default is checksumType
}

Install-ChocolateyPackage @packageArgs


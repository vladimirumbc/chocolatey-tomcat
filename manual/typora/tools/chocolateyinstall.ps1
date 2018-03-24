$ErrorActionPreference = 'Stop';

$packageName= 'typora'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://typora.io/windows/typora-setup-ia32.exe'
$url64      = 'https://typora.io/windows/typora-setup-x64.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'typora*'

  checksum      = '3625f2c966f6a3ee9cc55473c3467188b2812e95ab0ae236bc71c3d3606a5770'
  checksumType  = 'sha256'
  checksum64    = '4b7b15aa2219a3a60d9f17a5018165dcf9ca6079367ef3fa006d9e700d7a2f8d'
  checksumType64= 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

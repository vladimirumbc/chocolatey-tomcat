$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/kaikramer/keystore-explorer/releases/download/v5.3.2/kse-532.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '20420dfdb5af89a73399aba9a6d41fbaead7df8d0d29577a1216fd6bfadfc53f'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
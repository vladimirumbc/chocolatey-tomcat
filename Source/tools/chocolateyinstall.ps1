$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'Charles' # arbitrary name for the package, used in messages
  unzipLocation = $toolsDir
  fileType      = 'msi' #only one of these: exe, msi, msu
  url           = '{{Url32}}'
  url64bit      = '{{Url64}}'

  #MSI
  silentArgs    = "/qn /norestart"
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'Charles*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = '{{Checksum32}}'
  checksumType  = 'sha1'
  checksum64    = '{{Checksum64}}'
  checksumType64= 'sha1'
}

Install-ChocolateyPackage @packageArgs

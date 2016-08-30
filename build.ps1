#Requires -Version 4
Param(
    [Parameter(Mandatory=$true)]$charlesVersion
)

$url32 = "https://www.charlesproxy.com/assets/release/$charlesVersion/charles-proxy-$charlesVersion-win32.msi"
$url64 = "https://www.charlesproxy.com/assets/release/$charlesVersion/charles-proxy-$charlesVersion-win64.msi"

$buildPath = "$PSScriptRoot\.build"
$stagePath = "$buildPath\stage"
$tempPath = "$buildPath\temp"
$packagePath = "$buildPath\package"

if (Test-Path $buildPath) {
    Remove-Item -Recurse -Force $buildPath
}

New-Item -Type Directory $buildPath | Out-Null
New-Item -Type Directory $stagePath | Out-Null
New-Item -Type Directory $tempPath | Out-Null

Write-Host 'Downloading x32 for hash...give it a minute...'
(New-Object System.Net.WebClient).DownloadFile($url32, "$tempPath\charles32.msi")
Write-Host 'Downloading x64 for hash...give it a minute...'
(New-Object System.Net.WebClient).DownloadFile($url64, "$tempPath\charles64.msi")

$checksum32 = Get-FileHash -Path "$tempPath\charles32.msi" -Algorithm sha1
$checksum64 = Get-FileHash -Path "$tempPath\charles64.msi" -Algorithm sha1

Copy-Item -Recurse -Path '.\Source\*' -Destination $stagePath
(Get-Content "$stagePath\tools\chocolateyinstall.ps1") `
    -Replace '{{Url32}}', $url32 `
    -Replace '{{Url64}}', $url64 `
    -Replace '{{Checksum32}}', $checksum32.Hash `
    -Replace '{{Checksum64}}', $checksum64.Hash `
    | Set-Content "$stagePath\tools\chocolateyinstall.ps1"

Push-Location $stagePath
choco pack charles.nuspec --Version=$charlesVersion
Move-Item Charles.$charlesVersion.nupkg "$packagePath\"
Pop-Location

Write-Host "Your package is ready at $packagePath\Charles.$charlesVersion.nupkg"

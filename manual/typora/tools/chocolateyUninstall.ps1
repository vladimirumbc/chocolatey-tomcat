$ErrorActionPreference = 'Stop';

$programFiles = [Environment]::GetFolderPath([Environment+SpecialFolder]::ProgramFiles)
$uninstaller = Join-Path -Path $programFiles -ChildPath Typora | Join-Path -ChildPath unins000.exe

if (Test-Path -Path $uninstaller) {
  Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName `
                              -FileType exe `
                              -SilentArgs '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' `
                              -ValidExitCodes @(0) `
                              -File $uninstaller
} else {
  Write-Warning "$env:ChocolateyPackageTitle has already been uninstalled by other means."
}

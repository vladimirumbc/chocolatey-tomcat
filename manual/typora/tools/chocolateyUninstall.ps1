$ErrorActionPreference = 'Stop';

[array]$keys = Get-UninstallRegistryKey -SoftwareName 'typora*'

if ($keys.Count -eq 1) {
  $file = "$($keys[0].UninstallString)"

  Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName `
                              -FileType exe `
                              -SilentArgs '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' `
                              -ValidExitCodes @(0) `
                              -File "$file"
} elseif ($keys.Count -eq 0) {
  Write-Warning "$env:ChocolateyPackageTitle has already been uninstalled by other means."
} elseif ($keys.Count -gt 1) {
  Write-Error "$keys.Count matches found!"
  Write-Error "To prevent accidental data loss, no programs will be uninstalled."
  Write-Error "Please alert package maintainer the following keys were matched:"
  $keys | % {Write-Warning "- $_.DisplayName"}
  throw "Uninstallation failed."
}

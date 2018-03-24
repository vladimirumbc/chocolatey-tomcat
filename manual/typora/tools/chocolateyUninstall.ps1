$ErrorActionPreference = 'Stop';

[array]$key = Get-UninstallRegistryKey -SoftwareName 'typora*'

if ($key.Count -eq 1) {
  $key | % {
    $file = "$($_.UninstallString)"

    Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName `
                                -FileType exe `
                                -SilentArgs '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' `
                                -ValidExitCodes @(0) `
                                -File "$file"
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$env:ChocolateyPackageTitle has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$key.Count matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | % {Write-Warning "- $_.DisplayName"}
  throw "Uninstallation failed"
}

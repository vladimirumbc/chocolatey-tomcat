$ErrorActionPreference = 'Stop'

function global:au_GetLatest {
    $version = (Invoke-RestMethod -Uri 'https://www.charlesproxy.com/latest.do?v=3').Trim()
    @{
        Version = $version
        URL32 = "https://www.charlesproxy.com/assets/release/$version/charles-proxy-$version-win32.msi"
        URL64 = "https://www.charlesproxy.com/assets/release/$version/charles-proxy-$version-win64.msi"
    }
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            '(^\s*url\s*)=.*' = "`$1= '{0}'" -f $Latest.URL32
            '(^\s*url64bit\s*)=.*' = "`$1= '{0}'" -f $Latest.URL64
            '(^\s*checksum\s*)=.*' = "`$1= '{0}'" -f $Latest.Checksum32
            '(^\s*checksum64\s*)=.*' = "`$1= '{0}'" -f $Latest.Checksum64
        }
    }
}

Update-Package

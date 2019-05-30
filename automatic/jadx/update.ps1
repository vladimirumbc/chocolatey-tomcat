$ErrorActionPreference = 'Stop'

function global:au_GetLatest {
    $option = @{
        Uri = 'https://api.github.com/repos/skylot/jadx/releases/latest'
        Headers = @{ Accept = 'application/vnd.github.v3+json' }
    }
    $latest = Invoke-RestMethod @option
    $latest.tag_name -match 'v(\d+\.\d+\.\d+)'
    $version = $Matches[1]
    $zip = $latest.assets | Where-Object { $_.name -eq "jadx-$version.zip" }
    @{ Version = $version; Url = $zip.browser_download_url }
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            '(^\s*url\s*)=.*' = "`$1= '{0}'" -f $Latest.Url
            '(^\s*checksum\s*)=.*' = "`$1= '{0}'" -f $Latest.Checksum32
        }
    }
}

Update-Package

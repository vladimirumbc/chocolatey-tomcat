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
    @{ Version = $version; URL64 = $zip.browser_download_url; Filename64 = $zip.name }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            '[$]filename =.*' = '$filename = "{0}"' -f $Filename64
        }
        'tools\VERIFICATION.txt' = @{
            'SHA-256:.*' = 'SHA-256: {0}' -f $Latest.Checksum64
        }
    }
}

Update-Package

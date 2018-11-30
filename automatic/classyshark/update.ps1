$ErrorActionPreference = 'Stop'

function global:au_GetLatest {
    $option = @{
        Uri = 'https://api.github.com/repos/google/android-classyshark/releases/latest'
        Headers = @{ Accept = 'application/vnd.github.v3+json' }
    }
    $latest = Invoke-RestMethod @option
    @{
        Version = $latest.tag_name
        URL64 = $latest.assets[0].browser_download_url
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_SearchReplace {
    @{
        'tools\VERIFICATION.txt' = @{
            'SHA-256:.*' = 'SHA-256: {0}' -f $Latest.Checksum64
        }
    }
}

Update-Package -ChecksumFor none

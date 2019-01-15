$ErrorActionPreference = 'Stop'

function global:au_GetLatest {
    $option = @{
        Uri = 'https://api.github.com/repos/thumbsviewer/thumbsviewer/releases/latest'
        Headers = @{ Accept = 'application/vnd.github.v3+json' }
    }
    $latest = Invoke-RestMethod @option
    $zip32 = $latest.assets | Where-Object { $_.name.EndsWith('32.zip') }
    $zip64 = $latest.assets | Where-Object { $_.name.EndsWith('64.zip') }
    $latest.tag_name -match 'v(\d+\.\d+\.\d+\.\d+)'
    @{ Version = $Matches[1]; URL32 = $zip32.browser_download_url; URL64 = $zip64.browser_download_url }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_SearchReplace {
    @{
        'tools\VERIFICATION.txt' = @{
            'SHA-256 of 32-bit:.*' = 'SHA-256 of 32-bit: {0}' -f $Latest.Checksum32
            'SHA-256 of 64-bit:.*' = 'SHA-256 of 64-bit: {0}' -f $Latest.Checksum64
        }
    }
}

Update-Package -ChecksumFor none

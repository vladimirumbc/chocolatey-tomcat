$ErrorActionPreference = 'Stop'

function global:au_GetLatest {
    $root = 'https://www.benf.org/other/cfr/'
    $page = Invoke-WebRequest -Uri $root
    [array]$href = $page.Links | Select-Object -ExpandProperty href | Select-String -Pattern 'cfr-(\d+.\d+).jar'
    $url = $href[0].ToString()
    if (! $url.StartsWith('http')) {
        $url = $root + $url
    }
    @{ Version = $href[0].Matches.Groups[1]; URL64 = $url }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix -FileNameBase cfr }

function global:au_SearchReplace {
    @{
        'tools\VERIFICATION.txt' = @{
            'SHA-256:.*' = 'SHA-256: {0}' -f $Latest.Checksum64
        }
    }
}

Update-Package -ChecksumFor none

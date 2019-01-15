$ErrorActionPreference = 'Stop'

$root = 'https://www.benf.org/other/cfr/'

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $root
    [array]$href = $page.Links | Select-Object -ExpandProperty href | Select-String -Pattern '^cfr-(\d+.\d+).jar'
    @{ Version = $href[0].Matches.Groups[1]; URL64 = $root + $href[0] }
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

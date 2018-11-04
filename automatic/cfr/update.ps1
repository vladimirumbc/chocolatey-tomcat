$ErrorActionPreference = 'Stop'

$root = 'https://www.benf.org/other/cfr/'

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $root
    [array]$href = $page.Links | Select-Object -ExpandProperty href | Select-String -Pattern '^cfr_(\d+)_(\d+).jar'
    $groups = $href[0].Matches.Groups
    $version = '{0}.{1}' -f $groups[1], $groups[2]
    @{ Version = $version; URL64 = $root + $href[0] }
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

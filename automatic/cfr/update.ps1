$ErrorActionPreference = 'Stop'

$root = 'http://www.benf.org/other/cfr/'

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $root
    [array]$href = $page.Links | Select-Object -ExpandProperty href | Select-String -Pattern '^cfr_(\d+)_(\d+).jar'
    $groups = $href[0].Matches.Groups
    $version = '{0}.{1}' -f $groups[1], $groups[2]
    @{ Version = $version; Url = $root + $href[0] }
}

function global:au_SearchReplace {
    @{
        'cfr.nuspec' = @{
            '<version>[.\d]+</version>' = '<version>{0}</version>' -f $Latest.Version
        }
        'tools\chocolateyInstall.ps1' = @{
            '(^\s*url\s*)=.*' = "`$1= '{0}'" -f $Latest.Url
            '(^\s*checksum\s*)=.*' = "`$1= '{0}'" -f $Latest.Checksum64
        }
    }
}

Update-Package

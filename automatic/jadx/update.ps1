$ErrorActionPreference = 'Stop'

function global:au_GetLatest {
    $option = @{
        Uri = 'https://api.github.com/repos/skylot/jadx/releases/latest'
        Headers = @{ Accept = 'application/vnd.github.v3+json' }
    }
    $latest = Invoke-RestMethod @option
    $zip = $latest.assets | Where-Object { $_.name.EndsWith('.zip') }
    $latest.tag_name -match 'v(\d+\.\d+\.\d+)'
    @{ Version = $Matches[1]; Url = $zip.browser_download_url }
}

function global:au_SearchReplace {
    @{
        'jadx.nuspec' = @{
            '<version>[.\d]+</version>' = '<version>{0}</version>' -f $Latest.Version
        }
        'tools\chocolateyInstall.ps1' = @{
            '(^\s*url\s*)=.*' = "`$1= '{0}'" -f $Latest.Url
            '(^\s*checksum\s*)=.*' = "`$1= '{0}'" -f $Latest.Checksum32
        }
    }
}

Update-Package

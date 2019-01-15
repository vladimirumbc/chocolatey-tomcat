$ErrorActionPreference = 'Stop'

function global:au_GetLatest {
    $option = @{
        Uri = 'https://api.github.com/repos/kaikramer/keystore-explorer/releases/latest'
        Headers = @{ Accept = 'application/vnd.github.v3+json' }
    }
    $latest = Invoke-RestMethod @option
    $zip = $latest.assets | Where-Object { $_.name.EndsWith('.zip') }
    $latest.tag_name -match 'v(\d+\.\d+\.\d+)'
    @{
        Version = $Matches[1]; Url = $zip.browser_download_url
        Folder = $zip.name.Substring(0, $zip.name.Length - 4)
    }
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            '[$]folder\s*=.*' = "`$folder = '{0}'" -f $Latest.Folder
            '(^\s*url\s*)=.*' = "`$1= '{0}'" -f $Latest.Url
            '(^\s*checksum\s*)=.*' = "`$1= '{0}'" -f $Latest.Checksum32
        }
    }
}

Update-Package

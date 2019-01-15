$ErrorActionPreference = 'Stop'

function global:au_GetLatest {
    $feed = 'https://www.typora.io/windows/dev_update.xml'
    $assets = Invoke-RestMethod -Uri $feed | Select-Object -ExpandProperty enclosure
    @{
        Version = $assets[0].version
        URL32 = $assets | Where-Object -Property os -EQ windows-x86 | Select-Object -ExpandProperty url
        URL64 = $assets | Where-Object -Property os -EQ windows-x64 | Select-Object -ExpandProperty url
    }
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            '(^\s*url\s*)=.*' = "`$1= '{0}'" -f $Latest.URL32
            '(^\s*checksum\s*)=.*' = "`$1= '{0}'" -f $Latest.Checksum32
            '(^\s*url64bit\s*)=.*' = "`$1= '{0}'" -f $Latest.URL64
            '(^\s*checksum64\s*)=.*' = "`$1= '{0}'" -f $Latest.Checksum64
        }
    }
}

Update-Package

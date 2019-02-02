$ErrorActionPreference = 'Stop'

function global:au_GetLatest {
    $tags = Invoke-RestMethod -Uri https://api.github.com/repos/apache/tomcat/git/refs/tags
    $version = $tags[-1].ref.Substring(10) # last tag; remove prefix "refs/tags/"
    $checksum32Url = "https://archive.apache.org/dist/tomcat/tomcat-9/v$version/bin/apache-tomcat-$version-windows-x86.zip.sha512"
    $checksum64Url = "https://archive.apache.org/dist/tomcat/tomcat-9/v$version/bin/apache-tomcat-$version-windows-x64.zip.sha512"
    @{
        Version = $version
        URL32 = "https://archive.apache.org/dist/tomcat/tomcat-9/v$version/bin/apache-tomcat-$version-windows-x86.zip"
        Checksum32Url = $checksum32Url
        ChecksumType32 = 'sha512'
        URL64 = "https://archive.apache.org/dist/tomcat/tomcat-9/v$version/bin/apache-tomcat-$version-windows-x64.zip"
        Checksum64Url = $checksum64Url
        ChecksumType64 = 'sha512'
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_SearchReplace {
    $filename32 = Split-Path -Path $Latest.URL32 -Leaf
    $filename64 = Split-Path -Path $Latest.URL64 -Leaf
    $folderName = "apache-tomcat-{0}" -f $Latest.Version
    @{
        'tools\VERIFICATION.txt' = @{
            '^SHA-512 of 32-bit:.*' = 'SHA-512 of 32-bit: {0}' -f $Latest.Checksum32
            '^SHA-512 of 64-bit:.*' = 'SHA-512 of 64-bit: {0}' -f $Latest.Checksum64
            '^32-bit:.*' = '32-bit: {0}' -f $Latest.Checksum32Url
            '^64-bit:.*' = '64-bit: {0}' -f $Latest.Checksum64Url
        }
        'tools\chocolateyInstall.ps1' = @{
            '[$]filename32 =.*' = '$filename32 = "{0}"' -f $filename32
            '[$]filename64 =.*' = '$filename64 = "{0}"' -f $filename64
            '[$]zipContentFolderName =.*'= '$zipContentFolderName = "{0}"' -f $folderName
        }
        'tools\chocolateyUninstall.ps1' = @{
            '[$]zipContentFolderName =.*'= '$zipContentFolderName = "{0}"' -f $folderName
        }
    }
}

Update-Package -ChecksumFor none

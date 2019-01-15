$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$jarPath = Join-Path -Path $toolsDir -ChildPath 'cfr.jar'

[array]$javaCmds = Get-Command -Name java
if ($javaCmds[0].CommandType -ne 'Application') {
    throw 'Unexpected Java location'
}
Install-Binfile -Name $env:ChocolateyPackageName -Path $javaCmds[0].Definition -Command "`"-jar $jarPath`""

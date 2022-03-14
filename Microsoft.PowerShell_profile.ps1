if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}

$ProfileRoot = (Split-Path -Parent $MyInvocation.MyCommand.Path)
$AppsRoot = "C:\apps"
$env:path += ";$ProfileRoot"
$env:path += ";$ProfileRoot\scripts"
$env:path += ";$AppsRoot\powershell\scripts"

Set-Location C:\projects

. C:\apps\powershell\ps-profile.ps1
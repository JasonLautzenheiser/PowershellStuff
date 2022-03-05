$ProfileRoot = (Split-Path -Parent $MyInvocation.MyCommand.Path)
$env:path += ";$ProfileRoot"
$env:path += ";$ProfileRoot\scripts"

Set-Location C:\projects

. C:\apps\powershell\ps-profile.ps1
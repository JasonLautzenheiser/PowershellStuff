# if ($host.Name -eq 'ConsoleHost')
# {
#     Import-Module PSReadLine -MinimumVersion 2.2
# }

$ProfileRoot = (Split-Path -Parent $MyInvocation.MyCommand.Path)
$env:path += ";$ProfileRoot"
$env:path += ";$ProfileRoot\scripts"
$env:path += ";C:\Users\jlautzenheiser"

Set-Location C:\projects

# Set-PSReadLineKeyHandler -Key Alt+d -Function ShellKillWord
# Set-PSReadLineKeyHandler -Key Alt+Backspace -Function ShellBackwardKillWord
# Set-PSReadLineKeyHandler -Key Alt+b -Function ShellBackwardWord
# Set-PSReadLineKeyHandler -Key Alt+f -Function ShellForwardWord
# Set-PSReadLineKeyHandler -Key Alt+B -Function SelectShellBackwardWord
# Set-PSReadLineKeyHandler -Key Alt+F -Function SelectShellForwardWord

. C:\apps\powershell\ps-profile.ps1
write-host "Remove old versions of installed modules"

$mods = Get-InstalledModule

foreach ($module in $mods) {
    Write-Verbose -Message "Uninstalling old versions of $($module.Name) [latest is $( $module.Version)]" -Verbose
    Get-InstalledModule -Name $module.name -AllVersions | Where-Object {$_.version -ne $module.version } | Uninstall-Module -Verbose
}
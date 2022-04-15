<# .SYNOPSIS #>
param(
    [Parameter()]
    [string]$name, 
    [Parameter()]
    [switch]$includeAll,
    [Parameter()]
    [switch]$help
)

if ($help) {
    Write-Output "Usage: Remove-Old-Modules [-Name <string>] [-IncludeAll <switch>] [-Help <switch>]";
    exit;
}

if ($includeAll.IsPresent) {
    $mods = Get-InstalledModule 
    if ($mods.Count -eq 0)
    {
        write-host "No modules found."
        exit 1
    }

    write-host "Removing old versions of installed modules."

} else {
    if (!$name)
    {
        write-host "Please specify a module name."
        exit 1
    }

    $mods = Get-InstalledModule $name 
    if ($mods.Count -eq 0)
    {
        write-host "Module $name not found."
        exit 1
    }
}

foreach ($module in $mods) {
    Write-Host -Message "Removing old versions of $($module.Name) [latest is $( $module.Version)]"
    Get-InstalledModule -Name $module.name -AllVersions | Where-Object {$_.version -ne $module.version } | Uninstall-Module -Verbose
}
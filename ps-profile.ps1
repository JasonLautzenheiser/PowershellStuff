#region Aliases
$ar = get-alias -name g  -ErrorAction SilentlyContinue
if($ar.count -lt 1){
    New-Alias g git
}
#endregion Aliases

$ohMyPoshConfigOriginal = 'C:\Apps\powershell\prompt\oh-my-config.json'
$ohMyPoshConfig = "$env:USERPROFILE\oh-my-config.json"

try {
    if (Test-Path $ohMyPoshConfig) {
        $bak = "$ohMyPoshConfig.bak"
        if (Test-Path $bak) {
            Remove-Item $bak -Force
        }
        Copy-Item $ohMyPoshConfigOriginal $bak -Force
        Remove-Item $ohMyPoshConfig -Force
    }
    Copy-Item $ohMyPoshConfigOriginal $ohMyPoshConfig -Force
}
catch {
    Write-Warning "Unable to write oh-my-posh profile to $ohMyPoshConfig -- $($_)"
}

oh-my-posh init powershell --config $ohMyPoshConfig | Invoke-Expression

if (Get-Module Terminal-Icons -ListAvailable) {
    Import-Module Terminal-Icons
}

if (Get-Module z -ListAvailable) {
    Import-Module z
}

#region PSReadLine
Set-PSReadLineOption -PredictionSource History -PredictionViewStyle ListView -Colors @{ InlinePrediction = '#00aa00'} -EditMode Windows
#endregion PSReadLine


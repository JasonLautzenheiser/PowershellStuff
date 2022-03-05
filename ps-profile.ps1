#region Aliases
$ar = get-alias -name g  -ErrorAction SilentlyContinue
if($ar.count -lt 1){
    New-Alias g git
}
#endregion Aliases

if (Get-Module oh-my-posh -ListAvailable) {
    Import-Module oh-my-posh
    $ohMyPoshConfigOriginal = 'C:\Apps\powershell\prompt\oh-my-config.json'
    $ohMyPoshConfig = "$env:USERPROFILE\oh-my-config.json"

    try {
        if (Test-Path $ohMyPoshConfig) {
            Remove-Item $ohMyPoshConfig -Force
            $bak = "$ohMyPoshConfig.bak"
            if (Test-Path $bak) {
                Remove-Item $bak -Force
            }
        }
        Copy-Item $ohMyPoshConfigOriginal $ohMyPoshConfig -Force
    }
    catch {
        Write-Warning "Unable to write oh-my-posh profile to $ohMyPoshConfig -- $($_)"
    }
    oh-my-posh --init -shell pwsh --config $ohMyPoshConfig | Invoke-Expression
}

if (Get-Module Terminal-Icons -ListAvailable) {
    Import-Module Terminal-Icons
}

if (Get-Module z -ListAvailable) {
    Import-Module z
}

#region PSReadLine
Set-PSReadLineOption -PredictionSource History -PredictionViewStyle ListView -Colors @{ InlinePrediction = '#00aa00'} -EditMode Windows
#endregion PSReadLine


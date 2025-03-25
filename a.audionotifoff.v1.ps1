#AudioNotifOFF

Set-ItemProperty -Path "HKCU:\AppEvents\Schemes" -Name "(Default)" -Value ".None"
Stop-Process -Name explorer -Force

# Vérifier la valeur actuelle du schéma de sons
$currentSoundScheme = Get-ItemProperty -Path "HKCU:\AppEvents\Schemes" -Name "(Default)" -ErrorAction SilentlyContinue

# Si la valeur est ".None", afficher "Done"
if ($currentSoundScheme.'(Default)' -eq ".None") {
    Write-Output "Notifications coupées !"
} else {
    Write-Output "Le schéma de sons n'est pas défini sur 'Aucun son'."
}

exit
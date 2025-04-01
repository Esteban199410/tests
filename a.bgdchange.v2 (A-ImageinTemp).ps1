
# Chemin de l'image
$imagePath = $env:TEMP\1.png

# Vérifie si le fichier existe
if (-Not (Test-Path $imagePath)) {
    Write-Host "ERREUR : Le fichier spécifié n'existe pas."
    Start-Sleep -Seconds 2
    exit
}

# Change le fond d'écran
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@
[Wallpaper]::SystemParametersInfo(20, 0, $imagePath, 1 + 2)

Write-Host "Fond d'écran changé avec succès !"
# Pause silencieuse de 2 secondes
Start-Sleep -Seconds 1


Start-Sleep -Seconds 1 

exit
@echo off
:: Obtenir la lettre du lecteur actuel (où se trouve ce .bat)
set "currentPath=%~dp0"

:: Lancer le script PowerShell en utilisant le chemin dynamique
powershell -NoProfile -ExecutionPolicy Bypass -File "%currentPath%a.audiooff.v1.ps1"
timeout /t 1  >nul 

exit

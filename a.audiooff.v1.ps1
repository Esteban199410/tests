#VOLUMECHANGE
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
using System.Collections.Generic;

public class Audio {
    [DllImport("user32.dll")]
    public static extern int SendMessageW(IntPtr hWnd, int Msg, IntPtr wParam, IntPtr lParam);
}
"@

# Simule une pression sur la touche "Volume Up" 100 fois (pour s'assurer que le volume est au max)
for ($i = 0; $i -lt 100; $i++) {
    [Audio]::SendMessageW(0xFFFF, 0x319, 0, 0xA0000)
    Start-Sleep -Milliseconds 50  # Petite pause pour éviter les sauts de volume non détectés
}

Write-Host "Volume mis au maximum"

exit
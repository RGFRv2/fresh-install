# Vérifie si winget est installé
try {
    $wingetVersion = winget --version 2>$null
    if ($wingetVersion) {
        Write-Host "Winget est installé. Version : $wingetVersion"
    }
    else {
        throw "Winget non trouvé."
    }
}
catch {
    Write-Host "Winget n'est pas installé."
    Write-Host "Ouverture de la page Microsoft Store pour installer App Installer..."
    # Ouvre la page App Installer dans Microsoft Store
    Start-Process "ms-windows-store://pdp/?productid=9NBLGGH4NNS1"
}

_(GPT pour le Readme)_

# 📦 Installation Automatisée avec Winget

Ce projet contient une liste d’applications à installer via Winget, un gestionnaire de paquets Windows utilisant Winget et d’autres sources.

---

## Fichier de configuration

Le fichier `install_packages.ps1` liste les applications à installer, classées par catégories.

Exemple d’applications incluses : 7zip, DevToys, Brave, Git, Bitwarden, VLC, Spotify, Steam, et bien d’autres.

---

## Installation de UniGetUI

UniGetUI est un gestionnaire de paquets Windows qui simplifie l’installation groupée d’applications via Winget.

---

## Installation rapide

Ouvrez PowerShell en mode administrateur et lancez :

```powershell
winget install --id MortenDanielsen.UniGetUI -e --accept-package-agreements --accept-source-agreements
```

## Utilisation

Placez votre fichier install_packages.ps1 dans un dossier accessible.

Pour installer toutes les applications listées dans le fichier, exécutez la commande suivante dans PowerShell :

```powershell
./install_packages.ps1
```

## Applications à installer en dehors de Winget

- Aegisub
- AMD Adrenaline Software (Drivers AMD)
- Filezilla (no ADS)
- FreeFileSync
- iCloud -> Windows Store
- Python
- Thunderbird -> Utiliser BetterBird ?
- Uninstalr

## Applications optionnels
- Visual Studio Code -> Cursor

## Applications optionnels via Winget

```powershell
winget install -e --id Malwarebytes.Malwarebytes
winget install -e --id Google.Chrome
winget install -e --id Philips.HueSync
winget install -e --id Parsec.Parsec
```
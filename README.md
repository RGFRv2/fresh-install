*(GPT pour le Readme)*

# 📦 Installation Automatisée avec UniGet

Ce projet contient une liste d’applications à installer via UniGet, un gestionnaire de paquets Windows utilisant Winget et d’autres sources.

---

## Fichier de configuration

Le fichier `setup.uniget.yaml` liste les applications à installer, classées par catégories.

Exemple d’applications incluses : 7zip, DevToys, Brave, Git, Bitwarden, VLC, Spotify, Steam, et bien d’autres.

---

## Prérequis

- Windows 10/11 avec Winget installé (Windows Package Manager)
- PowerShell 7+ recommandé
- Connexion Internet active

---

## Installation d’UniGet et UniGetUI

UniGet est un gestionnaire de paquets Windows qui simplifie l’installation groupée d’applications via Winget.

Pour installer UniGet et son interface graphique UniGetUI, suivez les étapes ci-dessous.

---

## Installation rapide

Ouvrez PowerShell en mode administrateur et lancez :

```powershell
winget install --id MortenDanielsen.UniGet -e --accept-package-agreements --accept-source-agreements
winget install --id MortenDanielsen.UniGetUI -e --accept-package-agreements --accept-source-agreements
```

## Utilisation

Placez votre fichier setup.uniget.yaml dans un dossier accessible.

Pour installer toutes les applications listées dans le fichier, exécutez la commande suivante dans PowerShell :

```powershell
uniget install -f .\setup.uniget.yaml
```

**Pour lancer l’interface graphique UniGetUI, tapez :**

```powershell
unigetui
```

Cela vous permettra de gérer plus facilement les installations via une interface visuelle.

## Notes importantes

Les applications commentées dans le fichier YAML ne seront pas installées.

UniGet utilise Winget en backend, assurez-vous que Winget est à jour.

Vous pouvez modifier le fichier YAML pour ajouter ou retirer des applications selon vos besoins.

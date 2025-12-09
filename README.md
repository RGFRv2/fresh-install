_(GPT pour le Readme)_

# 📦 Installation Automatisée

**Systèmes Cibles :**
- Windows : Windows 11 25H2
- Linux : Debian 13

---

## 🪟 Windows (Winget)

Ce projet contient une liste d’applications à installer via Winget, un gestionnaire de paquets Windows utilisant Winget et d’autres sources.

### Fichier de configuration

Le fichier `install_packages.ps1` liste les applications à installer, classées par catégories.

Exemple d’applications incluses : 7zip, DevToys, Brave, Git, Bitwarden, VLC, Spotify, Steam, et bien d’autres.

### Installation de UniGetUI

UniGetUI est un gestionnaire de paquets Windows qui simplifie l’installation groupée d’applications via Winget.

### Installation rapide

Ouvrez PowerShell en mode administrateur et lancez :

```powershell
winget install --id MortenDanielsen.UniGetUI -e --accept-package-agreements --accept-source-agreements
```

### Utilisation

Placez votre fichier install_packages.ps1 dans un dossier accessible.

Pour installer toutes les applications listées dans le fichier, exécutez la commande suivante dans PowerShell :

```powershell
./install_packages.ps1
```

### Applications à installer en dehors de Winget

- Aegisub
- AMD Adrenaline Software (Drivers AMD)
- Filezilla (no ADS)
- FreeFileSync
- iCloud -> Windows Store
- Python
- Thunderbird -> Utiliser BetterBird ?
- Uninstalr

---

## 🐧 Linux (Debian)

Le dossier `linux/` contient un script `setup.sh` pour installer et configurer un environnement complet sur Debian.

### Fonctionnalités du script

Le script `setup.sh` automatise les tâches suivantes :

1.  **Installation des dépendances et outils** :
    *   **Base** : curl, wget, git, gnupg, lsb-release, aria2, ...
    *   **Outils** : zsh, htop, btop, neovim, tmux, fastfetch, unzip, p7zip-full, ffmpeg, rclone, fish, python3-pip...
    *   **Système** : lm-sensors, net-tools, nfs-common, nut.

2.  **Applications Spécifiques** :
    *   **MKVToolNix** : Installation depuis les dépôts officiels.
    *   **Docker** : Installation de Docker CE, Docker CLI, containerd et Docker Compose Plugin.

3.  **Configuration du Shell** :
    *   **ZSH** : Définit ZSH comme shell par défaut.
    *   **Zplug** : Installation du gestionnaire de plugins pour ZSH.
    *   **Starship** : Installation et configuration du prompt.

4.  **Gestion des Dotfiles** :
    *   Copie automatique de `.zshrc`, `.aliases`, `.tmux.conf` et `starship.toml` vers le dossier utilisateur.

5.  **Configuration NUT (Onduleur)** :
    *   Détecte automatiquement les fichiers `nut.conf` et `upsmon.conf` dans le dossier `linux/nut/`.
    *   Les copie vers `/etc/nut/` et configure les permissions (propriétaire `root:nut`, mode `640` pour les fichiers sensibles).
    *   Redémarre le service `nut-client`.

### Utilisation

1.  **Lancement** :

    ```bash
    cd linux
    chmod +x setup.sh
    ./setup.sh
    ```

    > **Note** : Les fichiers de configuration NUT (`nut.conf` et `upsmon.conf`) sont déjà inclus dans le dossier `linux/nut/`.
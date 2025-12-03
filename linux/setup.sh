#!/bin/bash
set -e # Arrête le script si une commande échoue

# Récupération du dossier où se trouve le script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "=========================================="
echo "      DÉBUT DE L'INSTALLATION"
echo "=========================================="

# --- 1. DÉFINITION DES PAQUETS ---

# Dépendances de base et système
deps=(
    curl
    wget
    git
    apt-transport-https
    ca-certificates
    gnupg
    gnupg2
    lsb-release
    software-properties-common
)

# Outils utilisateurs demandés
pkgs=(
    zsh
    htop
    btop
    net-tools
    neovim
    tmux
    fastfetch
    unzip
    zip
    p7zip-full
    unrar-free
    ffmpeg
    nfs-common
    rclone
    fish
)

# --- 2. INSTALLATION DES PAQUETS APT ---

echo "[MAJ & INSTALLATION DES DEPENDANCES]"
sudo apt update
sudo apt install "${deps[@]}" -y

echo "[INSTALLATION DES OUTILS]"
sudo apt install "${pkgs[@]}" -y


# --- 3. INSTALLATION MKVTOOLNIX (Optionnel) ---

echo "[INSTALLATION MKVTOOLNIX]"
# Ajout clef GPG
sudo wget -O /etc/apt/keyrings/gpg-pub-moritzbunkus.gpg https://mkvtoolnix.download/gpg-pub-moritzbunkus.gpg

# Ajout des repos
# Note: Utilisation de 'trixie' comme spécifié dans les notes originales
echo "deb [signed-by=/etc/apt/keyrings/gpg-pub-moritzbunkus.gpg] https://mkvtoolnix.download/debian/ trixie main" | sudo tee /etc/apt/sources.list.d/mkvtoolnix.download.list > /dev/null
echo "deb-src [signed-by=/etc/apt/keyrings/gpg-pub-moritzbunkus.gpg] https://mkvtoolnix.download/debian/ trixie main" | sudo tee -a /etc/apt/sources.list.d/mkvtoolnix.download.list > /dev/null

# Update et installation spécifique
sudo apt update
sudo apt install mkvtoolnix -y


# --- 4. CONFIGURATION DE ZSH ---

echo "[CONFIGURATION DU SHELL PAR DEFAUT]"
my_user=$(whoami)
if ! grep "${my_user}" /etc/passwd | grep -q zsh; then
    echo "> Changement du shell pour ${my_user} vers ZSH..."
    sudo usermod --shell /bin/zsh "${my_user}"
    echo "> Shell changé avec succès."
else
    echo "> ZSH est déjà le shell par défaut."
fi

# Installation de ZPLUG (Gestionnaire de plugins)
if [ ! -d ~/.zplug ]; then
    echo "[INSTALLATION DE ZPLUG]"
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
else
    echo "> Zplug déjà installé."
fi


# --- 5. INSTALLATION DE STARSHIP ---

if ! command -v starship &> /dev/null; then
    echo "[INSTALLATION DE STARSHIP]"
    curl -sS https://starship.rs/install.sh | sh -s -- -y
else
    echo "> Starship est déjà installé."
fi


# --- 6. COPIE DES FICHIERS DE CONFIGURATION ---

echo "[COPIE DES CONFIGURATIONS]"

# Fonction utilitaire pour copier avec backup si nécessaire
copy_config() {
    local src="$1"
    local dest="$2"
    
    if [ -f "$dest" ]; then
        echo "> Backup de $dest vers $dest.bak"
        mv "$dest" "$dest.bak"
    fi
    
    echo "> Copie de $(basename "$src") vers $dest"
    cp "$src" "$dest"
}

copy_config "$SCRIPT_DIR/.zshrc" ~/.zshrc
copy_config "$SCRIPT_DIR/.aliases" ~/.aliases
copy_config "$SCRIPT_DIR/.tmux.conf" ~/.tmux.conf

mkdir -p ~/.config
copy_config "$SCRIPT_DIR/starship.toml" ~/.config/starship.toml


# --- 7. FIN ---
echo "=========================================="
echo "      INSTALLATION TERMINÉE"
echo "=========================================="
echo "Redémarre ton terminal ou tape : zsh"
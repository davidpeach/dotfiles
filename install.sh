#!/usr/bin/bash

#--------------------------------------
# Installation script that I use to setup my 
# Lenovo Thinkpad T470
#--------------------------------------

INSTALL_PACKAGES=false

# -------------------------------------
# Installing the packages I use
# -------------------------------------
if [[ "$INSTALL_PACKAGES" == true ]]; then
sudo pacman -S \
    alsa-utils \
    ansible \
    bashtop \
    curl \
    dmidecode \
    docker \
    docker-compose \
    doctl \
    dunst \
    feh \
    firefox \
    fontconfig \
    fzf \
    github-cli \
    go \
    i3-wm \
    inotify-tools \
    jq \
    kitty \
    kubectl \
    libva-utils \
    make \
    mpv \
    neovim \
    nitrogen \
    pandoc-cli \
    picom \
    ranger \
    ripgrep \
    rsync \
    scrot \
    stow \
    task \
    terraform \
    tree \
    unzip \
    wget \
    wireguard-tools \
    xclip \
    xsel \
    xorg-server \
    xorg-xinit
fi

# install nvim-dap requirements for:
# - php
# - go

# --------------------------------
# Install Yay - AUR package helper
# --------------------------------
echo "Installing :: Yay AUR helper."
pushd "$HOME" || exit
git clone https://aur.archlinux.org/yay-git.git ./yay
pushd "$HOME"/yay || exit
makepkg -si --noconfirm
popd || exit
rm -rf ./yay
popd || exit
echo "Complete :: Yay AUR helper installed."
# ------------------------------
# Required packages from the AUR
# ------------------------------
echo "Installing :: Required Yay packages."
yay -S --noconfirm google-chrome google-cloud-cli google-cloud-sdk-gke-gcloud-auth-plugin signal-desktop slack-desktop
echo "Complete :: Required Yay packages."

# -------------------------------------
# Remove default ~/.local/bin as I have 
# my dotfiles version.
# -------------------------------------
if [[ -e $HOME/.local/bin ]]; then
	rm -rf "$HOME"/.local/bin
    echo "Removed :: Old local bin folder."
fi

# --------------------------------
# Ensure a ~/.config folder exists
# --------------------------------
if [[ ! -e $HOME/.config ]]; then
	mkdir -p "$HOME"/.config 
    echo "Created :: .config folder."
fi

# ------------------------
# Symlink all my dotfiles.
# ------------------------
declare stow_directories=(
    bashtop 
	bin
    dunst
	home
	i3
	kitty
	lynx
	nvim
	picom
	pictures
	ranger
    rofi
    ssh
    task
	tmux
)

for folder in "${stow_directories[@]}"; do
	stow "$folder"
    echo "Stowed :: $folder folder"
done

# SSH Key Generation
ssh-keygen -t rsa -f "$HOME"/.ssh/marnie -C "Marnie" -b 4096

# GPG key setup
# Might use a YubiKey
# Git config global settings (dotfile?)

# add the include into ssh config

echo "Install VictorMono nerd font with getnf"

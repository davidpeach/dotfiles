#!/usr/bin/bash

INSTALL_PACKAGES=false

if [[ "$INSTALL_PACKAGES" == true ]]; then
sudo pacman -S \
    alsa-utils \
    ansible \
    bashtop \
    dmidecode \
    docker \
    docker-compose \
    doctl \
    dunst \
    feh \
    firefox \
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
    wget \
    wireguard-tools \
    xorg-server \
    xorg-xinit
fi

# install nvim-dap requirements for:
# - php
# - go

# Install golang packages with go install for neovim
# - gofumpt
# - go delve
# YAY
# google-chrome
# google-cloud-cli
# google-cloud-sdk-gke-gcloud-auth-plugin
# signal-desktop
# slack-desktop

if [[ -e $HOME/.local/bin ]]; then
	rm -rf $HOME/.local/bin
fi

if [[ ! -e $HOME/.config ]]; then
	mkdir -p $HOME/.config 
fi


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
	stow "$folder" --dotfiles
done

# add the include into ssh config

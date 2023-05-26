#!/usr/bin/bash

INSTALL_PACKAGES=false

if [[ "$INSTALL_PACKAGES" == true ]]; then
sudo pacman -S \
    alsa-utils \
    btop \
    firefox \
    fzf \
    go \
    i3 \
    kitty \
    libva-utils \
    make \
    neovim \
    nitrogen \
    picom \
    signal-desktop \
    stow \
    tree \
    wget \
    xorg \
    xorg-xinit
fi
# install nvim-dap requirements for:
# - php
# - go

# Install golang packages with go install for neovim
# - gofumpt
# - go delve
# YAY
# slack-desktop

if [[ ! -e $HOME/.local/bin ]]; then
	mkdir -p $HOME/.local/bin
fi

if [[ ! -e $HOME/.config ]]; then
	mkdir -p $HOME/.config 
fi


declare stow_directories=(
	bin
	home
	i3
	kitty
	lynx
	nvim
	picom
	pictures
	ranger
	tmux
)

for folder in "${stow_directories[@]}"; do
	stow "$folder" --dotfiles
done

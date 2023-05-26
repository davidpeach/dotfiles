#!/usr/bin/bash

INSTALL=true

if
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
	home
	i3
	kitty
	lynx
	nvim
	picom
	pictures
	ranger
	scripts
	tmux
)

for folder in "$stow_directories[@]"; do
	stow -R "$folder"
done

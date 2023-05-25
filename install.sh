#!/bin/bash

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

rm ~/.bashrc
ln -s ~/dots/.bashrc ~/

rm ~/.xinitrc
ln -s ~/dots/.xinitrc ~/

[[ -e $HOME/.config ]] || mkdir -p "$HOME/.config"

rm -rf "$HOME"/.config/i3
ln -s "$HOME/dots/i3" "$HOME"/.config/i3

rm -rf "$HOME"/.config/nvim
ln -s "$HOME/dots/nvim" "$HOME"/.config/nvim

rm -rf "$HOME"/.config/kitty
ln -s "$HOME/dots/kitty" "$HOME"/.config/kitty

rm -rf "$HOME"/.local/bin
ln -s "$HOME/dots/scripts" "$HOME"/.local/bin

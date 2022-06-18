#!/bin/bash

sudo pacman -S \
    alsa-utils \
    btop \
    dbeaver \
    firefox \
    fzf \
    i3-gaps \
    kitty \
    leiningen \
    libva-utils \
    make \
    neovim \
    nitrogen \
    nnn \
    picom \
    polybar \
    signal-desktop \
    stow \
    tree \
    wget \
    xorg \
    xorg-xinit

# YAY
# slack-desktop

joinByChar() {
  local IFS="$1"
  shift
  joined="$*"
}

declare -a stowFolders=(
     bash
     bin
     dmenu-scripts
     i3
     kitty
     nvim
     polybar
     xmonad
     zsh
)

joinByChar ' ' "${stowFolders[@]}"

stow --restow $joined

#!/bin/bash

sudo pacman -S \
    stow \
    neovim \
    libva-utils \
    xorg \
    xorg-xinit \
    nitrogen \
    picom \
    i3-gaps \
    firefox \
    kitty

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

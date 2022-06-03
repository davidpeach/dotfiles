#!/bin/bash

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

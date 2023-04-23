#!/bin/bash

alias v="nvim"

alias be="v ~/.dotfiles/bash/.bash_aliases"
alias bs="source ~/.bashrc"
alias i3c="v ~/.dotfiles/i3/.config/i3/config"

alias vc="nano ~/.config/nvim/init.vim"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias c="clear"
alias h="c && cd ~ && ls -lah"

# =============
# Tmux Aliases.
# =============
alias t="tmux"
alias tk="t kill-server"
alias ta="t attach"

# ================
# Laravel Aliases.
# ================
alias a="php artisan"
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias stan="./vendor/bin/phpstan analyse"

alias g="git"
alias gs="g status"
alias ga="g add -p"
alias gaa="g add ."
alias gc="git commit -S -m"
alias gp="git push"
alias gpl="git pull"

alias lynx="~/.local/bin/lynx"
alias "?"="duck"


export EDITOR="nvim"
export VISUAL="nvim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$HOME/.bin:$HOME/.local/bin:$HOME/.config/composer/vendor/bin:$PATH

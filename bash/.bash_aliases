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

alias p="/home/david/Programs/PhpStorm/bin/phpstorm.sh"

alias a="php artisan"
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias stan="./vendor/bin/phpstan analyse"
alias t="./vendor/bin/phpunit"
alias tf="t --filter="
alias tt="stan && t"

alias g="git"
alias gs="g status"
alias ga="g add -p"
alias gaa="g add ."
alias gc="git commit -S -m"
alias gp="git push"
alias gpl="git pull"


export PATH=$HOME/.bin:$HOME/.config/composer/vendor/bin:$PATH

#                       ,---.           ,---.
#                      / /"`.\.--"""--./,'"\ \
#                      \ \    _       _    / /
#                       `./  / __   __ \  \,'
#                        /    /_O)_(_O\    \
#                        |  .-'  ___  `-.  |
#                     .--|       \_/       |--.
#                   ,'    \   \   |   /   /    `.
#                  /       `.  `--^--'  ,'       \
#               .-"""""-.    `--.___.--'     .-"""""-.
#          .---/         \------------------/         \---.
#          | .-\         /------------------\         /-. |
#          | |  `-`--`--'                    `--'--'-'  | |
#          | |         "David Peach's .bashrc"          | |
#          | |__________________________________________| |
#          |______________________________________________|
#                     )__________|__|__________(
#                    |            ||            |
#                    |____________||____________|
#                      ),-----.(      ),-----.(  
#                    ,'   ==.   \    /   .==   `.
#                   /            )  (            \
#                   `==========='    `==========='

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	 # We have color support; assume it's compliant with Ecma-48
	 # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	 # a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Aliases
# ============
alias v="nvim"

# Quick config editing
# --------------------------------------------
alias be="v ~/.dotfiles/bash/.bashrc"
alias bs="source ~/.bashrc"
alias i3c="v ~/.dotfiles/i3/.config/i3/config"

# Reverse directory nav
# --------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias c="clear"
alias x="exit"

# Tmux
# -------------------------
alias tk="tmux kill-server"
alias ta="tmux attach"

# Laravel
# -----------------------------------------------------------
alias a="php artisan"
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias stan="./vendor/bin/phpstan analyse"

# Git
# -------------------------
alias g="git"
alias gs="g status"
alias ga="g add -p"
alias gaa="g add ."
alias gc="git commit -S -m"
alias gp="git push"
alias gpl="git pull"

# Browser
# ----------------------------
alias lynx="~/.local/bin/lynx"
alias "?"="duck"

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi





# ===========
# Completions
# ===========
complete -C zet zet
complete -C geomiq geomiq
complete -C lupo lupo

# ================
# Export Variables
# ================
export PATH=$HOME/.bin:$HOME/.local/bin:$HOME/.config/composer/vendor/bin:$PATH
export EDITOR="nvim"
export VISUAL="nvim"
export SHELL=/usr/bin/bash
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Node Version Manager
# ----------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Work stuff
# ----------------------------------------------------------
export GEOMIQ_PROJECT_PATH="$HOME/Geomiq/code/site-app-test"
export GEOMIQ_GIT_HOST="geomiqgitlab"

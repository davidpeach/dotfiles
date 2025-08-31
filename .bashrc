# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# Environment Variables

# -- History
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

# -- General Settings
export EDITOR="nvim"
export VISUAL="nvim"
export SHELL=/usr/bin/bash
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# -- Directories
export REPOS="$HOME/repos"
export GITUSER="davidpeach"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export WORK="$HOME/work/projects"
export ZET_NOTES_DIR="$GHREPOS/zet"

export SCRIPTS="$HOME/.local/bin"
export GOBIN="$HOME/.local/bin"

export ZETROOT="$GHREPOS/zet"


# -- CD Path
# -- For CD Path tab autocompletion, install bash-completion
export CDPATH=./:$DOTFILES:$WORK:$HOME

# Path Additions
# -- Thanks to rwxrob.
pathappend() {
	declare arg
	for arg in "$@"; do
		test -d "$arg" || continue
		PATH=${PATH//":$arg:"/:}
		PATH=${PATH/#"$arg:"/}
		PATH=${PATH/%":$arg"/}
		export PATH="${PATH:+"$PATH:"}$arg"
	done
} && export -f pathappend

pathprepend() {
	for arg in "$@"; do
		test -d "$arg" || continue
		PATH=${PATH//:"$arg:"/:}
		PATH=${PATH/#"$arg:"/}
		PATH=${PATH/%":$arg"/}
		export PATH="$arg${PATH:+":${PATH}"}"
	done
} && export -f pathprepend

# Remember, the last arg will be first in path
pathprepend \
	"$HOME/.local/bin" \
	"$HOME/.local/go/bin" \
	"/usr/local/bin" \
  "$HOME/.local/share/gem/ruby/3.4.0/bin" \
  "$HOME/.ghcup/env" \
  "$HOME/npm/bin"

# Options
# -- append to the history file, don't overwrite it
shopt -s histappend

# -- If set, the pattern "**" used in a pathname expansion context will
# -- match all files and zero or more directories and subdirectories.
shopt -s globstar

# -- make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# -- set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

_PS1="\[\033[93;1m\]\u\[\033[31;1m\]@\[\033[35;1m\]\h \[\033[92;1m\]\w \[\033[0m\]"
_PS1_length=${#_PS1}
if [[ $_PS1_length -gt 40 ]]; then
    _PS1="$_PS1\n"
fi;

_PS1="$_PS1 🍑 "
PS1="$_PS1"

# Aliases
alias nv="nvim ."
alias r="ranger"

# -- Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias c="clear"
alias x="exit"

# -- Tmux
alias tk="tmux kill-server"

# -- Laravel
# -- might move these to a script
alias a="php artisan"
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias stan="./vendor/bin/phpstan analyse"

# -- Git
alias g="git"
alias ga="g add -p"
alias gaa="g add ."
alias gc="git commit -S -m"
alias gl="g log --oneline"
alias gp="git push"
alias gpl="git pull"
alias gs="g status"

# -- Browser
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

# Make GPG and pinentry work nicely.
GPG_TTY=$(tty)
export GPG_TTY
gpg-connect-agent updatestartuptty /bye >/dev/null

# Completions
complete -C z z
complete -C zz zz
complete -C zet zet
complete -C lupo lupo

export PATH="/home/david/.lando/bin:$PATH"; #landopath

export PATH="/home/david/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/david/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

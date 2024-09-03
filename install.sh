#----------------------------------------
# Installation script that I use to setup
# my Lenovo Thinkpad T470 / T490
#----------------------------------------

INSTALL_OFFICIAL_PACKAGES=false
INSTALL_AUR_PACKAGES=false

# -------------------------------
# Installing the packages I need.
# -------------------------------
if [[ "$INSTALL_OFFICIAL_PACKAGES" == true ]]; then
	sudo pacman -S --noconfirm \
		acpid \
		alsa-utils \
		ansible \
		aws-cli \
		base \
		base-devel \
		bc \
		bluez \
		bluez-utils \
		brightnessctl \
		ccls \
		chromium \
		curl \
		dmidecode \
		docker \
		doctl \
		dunst \
		entr \
		fd \
		feh \
		firefox \
		fontconfig \
		fwupd \
		fzf \
		github-cli \
		go \
		gopls \
		grub \
		haskell-language-server \
		htop \
		i3-wm \
		inotify-tools \
		jq \
		keychain \
		kitty \
		kubectl \
		libva-utils \
		linux-firmware-qlogic \
		linux-lts \
		luarocks \
		make \
		man-db \
		marksman \
		mpv \
		neovim \
		nitrogen \
		noto-fonts-emoji \
		obs-studio \
		obsidian \
		pandoc-cli \
		pavucontrol \
		picom \
		playerctl \
		polybar \
		ranger \
		ripgrep \
		rsync \
		s3cmd \
		scrot \
		shellcheck \
		sxiv \
		task \
		terraform \
		tlp \
		tree \
		unzip \
		wget \
		wireguard-tools \
		xclip \
		xsel \
		xorg-server \
		xorg-xinit \
		xorg-xrandr
fi

if [[ "$INSTALL_AUR_PACKAGES" == true ]]; then

	if [[ ! -x $(command -v yay)  ]]; then
		echo "Stopping :: Please install the yay package"
		exit
	fi

	yay -S --noconfirm \
		aic94xx-firmware \
		ast-firmware \
		jira-cli \
		mycli \
		phpactor \
		python-sqlglot \
		quarto-cli-bin \
		r-styler \
		signal-desktop \
		slack-desktop \
		upd72020x-fw \
		wd719x-firmware
	echo "Complete :: Required Yay packages."
fi

# -------------------------------------
# Remove default ~/.local/bin as I have
# my dotfiles version.
# -------------------------------------
if [[ -e $HOME/.local/bin ]]; then
	rm -rf "$HOME"/.local/bin
	echo "Removed :: Old local bin folder."
fi

# --------------------------------
# Ensure a ~/.config folder exists
# --------------------------------
if [[ ! -e $HOME/.config ]]; then
	mkdir -p "$HOME"/.config
	echo "Created :: .config folder."
fi

# Symlink all my dotfiles.
ln -sf "$PWD/i3" "$HOME/.config/" && echo "Symlinked i3 config."
ln -sf "$PWD/nvim" "$HOME/.config/" && echo "Symlinked nvim config."
ln -sf "$PWD/polybar" "$HOME/.config/" && echo "Symlinked polybar config."
ln -sf "$PWD/picom" "$HOME/.config/" && echo "Symlinked picom config."
ln -sf "$PWD/wallpapers" "$HOME/.config/" && echo "Symlinked wallpapers."
ln -sf "$PWD/scripts" "$HOME/.local/bin" && echo "Symlinked scripts folder."
ln -sf "$PWD/ranger" "$HOME/.config/" && echo "Symlinked ranger folder."
ln -sf "$PWD/.tmux.conf" "$HOME/.tmux.conf" && echo "Symlinked tmux config."
ln -sf "$PWD/.bashrc" "$HOME/.bashrc" && echo "Symlinked bashrc config."
ln -sf "$PWD/.vimrc" "$HOME/.vimrc" && echo "Symlinked vimrc config."
ln -sf "$PWD/.inputrc" "$HOME/.inputrc" && echo "Symlinked inputrc config."
ln -sf "$PWD/.xinitrc" "$HOME/.xinitrc" && echo "Symlinked xinitrc config."
ln -sf "$PWD/.Xresources" "$HOME/.Xresources" && echo "Symlinked Xresources config."
ln -sf "$PWD/kitty" "$HOME/.config/" && echo "Symlinked kitty folder."
ln -sf "$PWD/alacritty" "$HOME/.config/" && echo "Symlinked alacritty folder."
ln -sf "$PWD/lynx" "$HOME/.config/" && echo "Symlinked lynx folder."
ln -sf "$PWD/dunst" "$HOME/.config/" && echo "Symlinked dunst folder."
ln -sf "$PWD/ssh.d" "$HOME/.config/" && echo "Symlinked ssh.d folder."
ln -sf "$PWD/task" "$HOME/.config/" && echo "Symlinked task folder."

# SSH Key Generation
# ssh-keygen -t rsa -f "$HOME"/.ssh/marnie -C "Marnie" -b 4096

# GPG key setup
# Might use a YubiKey
# Git config global settings (dotfile?)

# add the include into ssh config

echo "This setup file is not yet complete."

#----------------------------------------
# Installation script that I use to setup
# my Lenovo Thinkpad T470 / T490
#----------------------------------------

INSTALL_PACKAGES=false

# -------------------------------
# Installing the packages I need.
# -------------------------------
if [[ "$INSTALL_PACKAGES" == true ]]; then
	sudo pacman -S \
		alsa-utils \
		ansible \
		chromium \
		curl \
		dmidecode \
		docker \
		doctl \
		dunst \
		feh \
		firefox \
		fontconfig \
		fzf \
		github-cli \
		go \
		i3-wm \
		inotify-tools \
		jq \
		kitty \
		kubectl \
		libva-utils \
		make \
		mpv \
		nitrogen \
		pandoc-cli \
		picom \
		ranger \
		ripgrep \
		rsync \
		scrot \
		task \
		terraform \
		tree \
		unzip \
		wget \
		wireguard-tools \
		xclip \
		xsel \
		xorg-server \
		xorg-xinit

	# Install Yay - AUR package helper
	echo "Installing :: Yay AUR helper."
	pushd "$HOME" || exit
	git clone https://aur.archlinux.org/yay-git.git ./yay
	pushd "$HOME"/yay || exit
	makepkg -si --noconfirm
	popd || exit
	rm -rf ./yay
	popd || exit
	echo "Complete :: Yay AUR helper installed."
	# ------------------------------
	# Required packages from the AUR
	# ------------------------------
	echo "Installing :: Required Yay packages."
	yay -S --noconfirm \
		mycli \
		neovim-git \
		python-sqlglot \
		signal-desktop \
		slack-desktop
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
ln -sf "$PWD/lynx" "$HOME/.config/" && echo "Symlinked lynx folder."
ln -sf "$PWD/dunst" "$HOME/.config/" && echo "Symlinked dunst folder."
ln -sf "$PWD/ssh.d" "$HOME/.config/" && echo "Symlinked ssh.d folder."

# SSH Key Generation
# ssh-keygen -t rsa -f "$HOME"/.ssh/marnie -C "Marnie" -b 4096

# GPG key setup
# Might use a YubiKey
# Git config global settings (dotfile?)

# add the include into ssh config

echo "This setup file is not yet complete."

#!/usr/bin/env bash

set -eu

# Function to generate locales
generate_locales() {
    echo "Generating locales..."
    if [[ "$OS" == "Ubuntu" ]]; then
        sudo locale-gen en_US.UTF-8
        sudo update-locale LANG=en_US.UTF-8
    elif [[ "$OS" == "Arch Linux" ]]; then
        # Uncomment en_US.UTF-8 in locale.gen if not already
        sudo sed -i 's/^#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
        sudo locale-gen
        echo "LANG=en_US.UTF-8" | sudo tee /etc/locale.conf
    fi
    
    # Source locale settings immediately
    if [ -f /etc/profile.d/locale.sh ]; then
        source /etc/profile.d/locale.sh
    fi
}

install_shared() {
    # Install bash-language-server
    echo "Installing bash-language-server..."
    sudo npm install -g bash-language-server

    # Install gopls
    echo "Installing gopls..."
    go install golang.org/x/tools/gopls@latest
}

# Function to install packages on Ubuntu
install_ubuntu() {
    echo "Installing packages for Ubuntu..."
    sudo apt-get update
    sudo apt-get install -y tmux golang git zsh ripgrep fzf build-essential locales shellcheck npm jq aspell

    # Install Neovim nightly
    echo "Installing Neovim nightly..."
    sudo add-apt-repository -y ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install -y neovim

		# Install node 20 (at least need for wsl)
		curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
		sudo apt-get install -y nodejs

    install_shared
}

# Function to install packages on Arch Linux
install_arch() {
    echo "Moving to home ~"
    cd ~
    echo "Installing packages for Arch Linux..."
    sudo pacman -Syu --noconfirm base-devel coreutils tmux go git zsh ripgrep fzf shellcheck npm less aspell

    # Install yay if not present (without sudo)
    if ! command -v yay &> /dev/null; then
        echo "yay is not installed. Installing..."
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ..
        rm -rf yay
    fi
    
    # Install Neovim nightly from AUR
    echo "Installing Neovim nightly from AUR..."
    yay -S --noconfirm neovim-nightly-bin
    
    install_shared
}

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
else
    echo "Cannot determine OS."
    exit 1
fi

# Install packages based on OS
if [[ "$OS" == "Ubuntu" ]]; then
    install_ubuntu
elif [[ "$OS" == "Arch Linux" ]]; then
    install_arch
else
    echo "Unsupported OS: $OS"
    exit 1
fi

# Generate locales and source them
generate_locales

# Change default shell to zsh
echo "Changing default shell to zsh..."
sudo chsh -s $(which zsh) "$USER"

# Install zinit (doesn't need sudo)
echo "Installing zinit..."
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

echo "All tools installed successfully!"
echo "Locale settings have been applied. Please log out and log back in for the shell change to take effect."

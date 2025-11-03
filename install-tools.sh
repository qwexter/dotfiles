#!/bin/bash

# Exit on error
set -e

# Function to install packages on Ubuntu
install_ubuntu() {
    echo "Installing packages for Ubuntu..."
    sudo apt-get update
    sudo apt-get install -y tmux golang git zsh

    # Install Neovim nightly
    echo "Installing Neovim nightly..."
    sudo add-apt-repository -y ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install -y neovim
}

# Function to install packages on Arch Linux
install_arch() {
    echo "Installing packages for Arch Linux..."
    sudo pacman -Syu --noconfirm tmux go git zsh

    # Install Neovim nightly from AUR (assuming yay is installed)
    echo "Installing Neovim nightly from AUR..."
    if ! command -v yay &> /dev/null; then
        echo "yay is not installed. Please install it first."
        exit 1
    fi
    yay -S --noconfirm neovim-nightly-bin
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

# Change default shell to zsh
echo "Changing default shell to zsh..."
sudo chsh -s $(which zsh) $USER

echo "All tools installed successfully!"

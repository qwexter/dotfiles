#!/bin/bash

# Exit on error
set -e

# Check for and install Apple Developer Tools
if ! xcode-select -p &> /dev/null; then
    echo "Apple Developer Tools not found. Please install them by running 'xcode-select --install'"
    exit 1
fi

# Check for and install Homebrew
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install packages from Brewfile
echo "Installing packages from Brewfile..."
brew bundle install --file="$(dirname "$0")/Brewfile"

# Change default shell to zsh
if [ "$SHELL" != "/bin/zsh" ]; then
  echo "Changing default shell to zsh..."
  sudo chsh -s /bin/zsh $USER
fi

echo "All tools installed successfully!"
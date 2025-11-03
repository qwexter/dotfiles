#!/bin/bash

# Get the directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# --- Git Configuration ---
if [ -n "$1" ] && [ -n "$2" ]; then
  git config --global user.name "$1"
  git config --global user.email "$2"
fi

# --- Symlink Function ---
create_symlink() {
  local source=$1
  local destination=$2

  if [ -L "${destination}" ]; then
    echo "Symlink already exists: ${destination}"
  elif [ -e "${destination}" ]; then
    echo "File already exists and is not a symlink: ${destination}"
  else
    ln -s "${source}" "${destination}"
    echo "Created symlink: ${destination}"
  fi
}

# --- Create Directories ---
mkdir -p "$HOME/.dotfiles"
mkdir -p "$HOME/.config"

# --- Symlink Shared Files ---
create_symlink "$DIR/shared/.gitconfig" "$HOME/.gitconfig"
create_symlink "$DIR/shared/.zshrc" "$HOME/.zshrc"
create_symlink "$DIR/shared/.tmux.conf" "$HOME/.tmux.conf"
create_symlink "$DIR/shared/.gitconfig.work" "$HOME/.dotfiles/.gitconfig.work"
create_symlink "$DIR/shared/ssh" "$HOME/.dotfiles/ssh"

# --- Symlink Neovim and Tmux Configuration ---
create_symlink "$DIR/nvim" "$HOME/.config/nvim"
create_symlink "$DIR/shared/tmux" "$HOME/.config/tmux"

# --- Symlink OS-specific Files ---
if [[ "$(uname)" == "Darwin" ]]; then
  # macOS
  create_symlink "$DIR/macos/.zprofile" "$HOME/.zprofile"
fi

if [[ "$(uname)" == "Linux" ]]; then
  # Linux
  create_symlink "$DIR/linux/.zprofile" "$HOME/.zprofile"
fi

# Windows-specific setup would go here
# You might need a different script (e.g., a PowerShell script) for Windows
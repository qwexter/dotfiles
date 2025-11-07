#!/usr/bin/env bash

# Get the directory of this script
DIR="$(pwd)"

# --- Symlink Function ---
create_symlink() {
  local source=$1
  local destination=$2
  
  if [ -L "${destination}" ]; then
    echo "Symlink already exists: ${destination}"
  elif [ -e "${destination}" ]; then
    echo "File exists at ${destination}, backing up and creating symlink..."
    mv "${destination}" "${destination}.backup.$(date +%Y%m%d_%H%M%S)"
    ln -s "${source}" "${destination}"
    echo "Created symlink: ${destination} (old file backed up)"
  else
    ln -s "${source}" "${destination}"
    echo "Created symlink: ${destination}"
  fi
}

# --- Create Directories ---
mkdir -p "$HOME/.config"

# --- Symlink Shared Files ---
create_symlink "$DIR/shared/.gitconfig" "$HOME/.gitconfig"
create_symlink "$DIR/.zshrc" "$HOME/.zshrc"
create_symlink "$DIR/shared/.tmux.conf" "$HOME/.tmux.conf"

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

echo ""
echo "Dotfiles installation complete!"
echo "Backed up files are saved with .backup.TIMESTAMP extension"

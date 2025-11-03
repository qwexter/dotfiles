# Dotfiles

This repository contains my personal dotfiles for macOS, Windows 11 (via WSL2), and Linux. The goal is to create a minimal, consistent, and cross-platform development environment.

## Features

- **Cross-Platform:** Supports macOS, Linux (Ubuntu, Arch), and Windows 11 (WSL2).
- **Zsh Shell:** Uses Zsh as the default shell for a consistent experience.
- **Neovim Configuration:** Includes a customized Neovim setup with LSP support.
- **Tmux Configuration:** Provides a shared tmux setup for session management.
- **Git Configuration:** Separates personal and work Git configurations.
- **Automated Installation:** Scripts to automate the installation of tools and dotfiles.

## Configured Tools

- **[Zsh](https://www.zsh.org/):** A powerful and customizable shell.
- **[Neovim](https://neovim.io/):** A modern and highly extensible text editor.
- **[Tmux](https://github.com/tmux/tmux/wiki):** A terminal multiplexer for managing multiple terminal sessions.
- **[Git](https://git-scm.com/):** A distributed version control system.
- **[Go](https://golang.org/):** A statically typed, compiled programming language.

## Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
    ```

2.  **Install tools:**

    -   **macOS:**

        ```bash
        ~/.dotfiles/install-tools-macos.sh
        ```

    -   **Linux (Ubuntu/Arch):**

        ```bash
        ~/.dotfiles/install-tools.sh
        ```

3.  **Install dotfiles:**

    ```bash
    ~/.dotfiles/install.sh
    ```

## Usage

### Git Configuration

This setup allows you to maintain separate Git configurations for personal and work projects.

-   **Personal:** The default Git configuration uses the email address specified in `shared/.gitconfig`.
-   **Work:** If a repository is located in the `~/work/` directory, the email address from `shared/.gitconfig.work` will be used. You can customize this directory in `shared/.gitconfig`.

### SSH Keys

The `shared/ssh/ssh-add.sh` script automatically adds your SSH keys to the `ssh-agent`. You can add machine-specific keys by creating a `~/.ssh/ssh-add-local.sh` file.

### Neovim

The Neovim configuration is located in the `nvim/` directory. It includes LSP support for Go and Bash, a custom color scheme, and key mappings.

### Tmux

The tmux configuration is located in `shared/.tmux.conf`. It includes a custom status bar that displays the current Git branch.
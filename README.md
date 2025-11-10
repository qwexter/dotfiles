# dotfiles

A simple solution to share the same UX across different platforms (macOS, Ubuntu, and Arch including WSL2).

This isn't about 10x productivity—it's a simple way to bootstrap WSL2 or plain Linux when needed. Used mainly for bash scripts, small Golang services, internal apps, and DevOps routines.

**Please note:** This repo isn't a production-high-grade-state-of-the-art-rocket-science-elonmasked solution. It's simple enough to be used super rarely. I haven't touched my MacBook setup for 3-4 years, and I replace or wipe WSL2 distros 1-2 times per year or install on bare-metal. Oh, and it has security flaws, but I understand them and take the risks.

## On Linux

<details>
<summary>Don't forget to set up a user and supportive apps</summary>

**Arch:**

1. Create a user:
```sh
useradd -m -G wheel -s /bin/bash %s
passwd %s
```
Don't forget to set a password for root too (if not set).

2. Install sudo and nano (or any other editor):
```sh
pacman -S nano sudo
```

3. Enable sudo for wheel group:
```bash
EDITOR=nano visudo
# Uncomment this line:
# %wheel ALL=(ALL:ALL) ALL
```

**Ubuntu:**

Same logic, slightly different commands:
```bash
adduser yourusername
usermod -aG sudo yourusername
apt-get update
apt-get install nano sudo curl
su - yourusername
```

</details>

Install shared apps:
```bash
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/qwexter/dotfiles/refs/heads/main/install-tools.sh)"
```

This installs:
- **Core:** tmux, git, zsh, neovim (nightly), curl, unzip
- **Search:** ripgrep, fzf
- **Development:** golang, shellcheck, jq, aspell
- **Build:** build-essential (Ubuntu) / base-devel (Arch)
- **Language servers:** bash-language-server (npm), gopls (go)

Next, set up links to configurations:
```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Setup symlinks
./setup_env.sh
```

## macOS

Same approach but uses a different script to install shared apps (doesn't include Xcode tools setup yet):
```bash
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/qwexter/dotfiles/refs/heads/main/install-tools-macos.sh)"
```

Then use the same configuration setup:
```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Setup symlinks
./setup_env.sh
```

## For Future Me

Be very careful if you use any LLM to change scripts or layout setup here—at least check that the result doesn't expose any real git-related keys, etc. In general, keep an eye on git configuration. It seems better to manage it individually per working project. For WSL, you can share personal keys, or just create individual ones per environment.

As an alternative and better solution, try [chezmoi](https://www.chezmoi.io/), [stow](https://www.gnu.org/software/stow/), or [yadm](https://yadm.io/). They're better, and _chezmoi_ and _yadm_ handle some security flaws.

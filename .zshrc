### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} %F{220}The clone has failed.%f%b"
fi
# zinit setup
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# setup promt, let's try geometry-dash
zinit lucid light-mode for geometry-zsh/geometry

# fzfing
zinit pack"default+keys" for fzf
zinit wait lucid for pick'shel/key-binding.zsh' junegunn/fzf
zinit light Aloxaf/fzf-tab

EDITOR=nvim

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
# Setup history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt histignorealldups sharehistory inc_append_history HIST_IGNORE_SPACE


export XDG_CONFIG_HOME=~/.config
# export for gopath
export PATH="$PATH:$HOME/go/bin"
# export for pipx
export PATH="$PATH:/Users/al/.local/bin"

# coloring
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -c=auto'

export TERM="tmux-256color"

# fast nav to dots
alias cdd='cd ~/.dotfiles'
# fast nav to projects
alias cdp='cd ~/projects'

# shorter nvim -> vim
alias vim='nvim'

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
# Set up colors for ls
if command -v dircolors &> /dev/null; then
    eval "$(dircolors -b)"
fi
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

zinit wait lucid for \
    as"completion" \
    gradle/gradle-completion
zinit snippet OMZP::fzf    # FZF completion snippet
zinit snippet OMZP::git    # Git completion snippet

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


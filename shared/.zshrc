# Shared Bash configuration

# Set a simple prompt
PS1='\u@\h:\w\$ ' 

# Add SSH keys to the agent
if [ -f "$HOME/.dotfiles/ssh/ssh-add.sh" ]; then
    . "$HOME/.dotfiles/ssh/ssh-add.sh"
fi

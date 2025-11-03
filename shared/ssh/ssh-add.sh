#!/bin/bash

# Add SSH keys to the agent

# Start the ssh-agent if it's not running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-info
fi

# Source the agent info
if [ -f ~/.ssh-agent-info ]; then
    . ~/.ssh-agent-info
fi

# Add common keys
ssh-add -q ~/.ssh/personal
ssh-add -q ~/.ssh/work

# Add machine-specific keys
if [ -f ~/.ssh/ssh-add-local.sh ]; then
    . ~/.ssh/ssh-add-local.sh
fi

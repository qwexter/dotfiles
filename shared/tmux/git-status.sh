#!/bin/bash

branch=$(git branch --show-current 2>/dev/null)

# Only show if we're in a git directory
if [ -n "$branch" ]; then
    if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
        # Dirty - red background
        echo "#[fg=white,bg=red,bold] ${branch}* #[default]"
    else
        # Clean - green background
        echo "#[fg=white,bg=green,bold] ${branch} #[default]"
    fi
fi
# If not in git directory, output nothing (status bar shows empty)

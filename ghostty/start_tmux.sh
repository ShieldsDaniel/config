#!/bin/bash

SESSION_NAME="󰘧"

tmux_full=$(which tmux) || /opt/homebrew/bin/tmux

echo "$tmux_full"

# Check if the session already exists
$tmux_full has-session -t $SESSION_NAME 2>/dev/null

if [ $? -eq 0 ]; then
    # If the session exists, reattach to it
    $tmux_full attach-session -t $SESSION_NAME
else
    # If the session doesn't exist, start a new one
    $tmux_full new-session -s $SESSION_NAME -d
    $tmux_full attach-session -t $SESSION_NAME
fi

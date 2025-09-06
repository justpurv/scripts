#!/usr/bin/env bash

# directory where your projects live
PROJECTS_DIR=~/Documents
# pick a project with fzf
selected=$(find "$PROJECTS_DIR" -mindepth 1 -maxdepth 1 -type d | fzf)

[ -z "$selected" ] && exit 0

session_name=$(basename "$selected")

# if session exists, attach; otherwise create
if tmux has-session -t "$session_name" 2>/dev/null; then
    tmux attach -t "$session_name"
else
    tmux new-session -s "$session_name" -c "$selected"
fi

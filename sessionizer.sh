#!/bin/bash

# Define the base directory for your sessions (e.g., your projects folder)
# Use this in .local/bin for easy use
BASE_DIR="$HOME/Documents/" 

# Get a list of directories within the base directory
# You can adjust this to filter or select specific directories
directories=$(find "$BASE_DIR" -maxdepth 1 -type d -printf "%f\n" | grep -v "^\.$")

# Use fzf (or similar fuzzy finder) to select a directory
selected_dir=$(echo "$directories" | fzf --prompt="Select session: ")

# If no directory is selected, exit
if [ -z "$selected_dir" ]; then
    exit 0
fi

# Construct the session name from the selected directory
session_name=$(basename "$selected_dir")

# Check if the session already exists
if ! tmux has-session -t "$session_name" 2>/dev/null; then
    # If not, create a new session and attach to it
    tmux new-session -s "$session_name" -c "$BASE_DIR/$selected_dir"
else
    # If it exists, attach to the existing session
    tmux attach-session -t "$session_name"
fi

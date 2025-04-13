#!/bin/bash

# Get the current tmux session and window
session_name=$(tmux display-message -p '#S')
window_index=$(tmux display-message -p '#I')

nvim_found=false

while read -r _ pane_cmd; do
  if [[ "$pane_cmd" == *"nvim"* ]]; then
    nvim_found=true
  fi
done < <(tmux list-panes -t "${session_name}:${window_index}" -F '#{pane_pid} #{pane_current_command}')

if $nvim_found; then
  tmux set -w status off
else
  tmux set -w status on
fi

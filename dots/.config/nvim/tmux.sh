#!/bin/bash

# Get the current tmux session and window
session_name=$(tmux display-message -p '#S')
window_index=$(tmux display-message -p '#I')

# Iterate over all panes in the current tmux window
tmux list-panes -t "${session_name}:${window_index}" -F '#{pane_pid} #{pane_current_command}' | while read -r pane_pid pane_cmd; do
  if [[ "$pane_cmd" == *"nvim"* ]] || pgrep -fla "^$pane_pid.*nvim" >/dev/null; then
    tmux set status off
    exit 0
  else
    tmux set status on
    exit 0
  fi
done

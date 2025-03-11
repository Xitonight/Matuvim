#!/usr/bin/env bash

backup_old_files() {
  if [ ! -d ./backup ]; then
    mkdir backup
  fi
  mv ~/.config/nvim/ ./backup/conf
  mv ~/.local/share/nvim ./backup/share
  mv ~/.local/state/nvim ./backup/state
}

clone_nvchad() {
  git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
}

stow_dots() {
  stow --target=/home/$(whoami) --restow dots
}

echo "Backing up old files in $(dirname "$0")."
backup_old_files
echo "Cloning NvChad, neovim will open shortly, do not touch anything."
clone_nvchad
echo "Stowing new dotfiles."
stow_dots
nvim

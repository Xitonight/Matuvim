#!/usr/bin/env bash

backup_old_files() {
  mkdir backup
  mv ~/.config/nvim/ ~/.local/share/nvim ~/.local/state/nvim ./backup
}

clone_nvchad() {
  git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
}

stow_dots() {
  stow --target=/home/$(whoami) dots --adopt 
}

echo "Backing up old files in $(dirname "$0")."
backup_old_files
echo "Cloning NvChad, neovim will open shortly, do not touch anything."
clone_nvchad
echo "Stowing new dotfiles."
stow_dots
nvim

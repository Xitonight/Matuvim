#!/usr/bin/env bash

set -e
set -u
set -o pipefail

INSTALL_DIR=${1:-"$HOME/neoconf"}
MATUGEN_DIR="$HOME/.config/matugen"
REPO_URL="https://github.com/Xitonight/neoconf"

clone_repo() {
  if [ -d "$INSTALL_DIR" ]; then
    echo "Updating neoconf..."
    git -C "$INSTALL_DIR" pull
  else
    echo "Cloning neoconf..."
    git clone "$REPO_URL" "$INSTALL_DIR"
  fi
}

clone_nvchad() {
  echo "Cloning NvChad, neovim will open shortly, do not touch anything..."

  if [ -d ~/.config/nvim/ ]; then
    if [ ! -e ~/.config/nvim.bkp ]; then
      cp -R ~/.config/nvim/ ~/.config/nvim.bkp
    fi
    rm -rf ~/.config/nvim
  fi
  if [ -d ~/.local/share/nvim/ ]; then
    if [ ! -e ~/.local/share/nvim.bkp ]; then
      cp -R ~/.local/share/nvim/ ~/.local/share/nvim.bkp
    fi
    rm -rf ~/.local/share/nvim
  fi
  if [ -d ~/.local/state/nvim/ ]; then
    if [ -e ~/.local/state/nvim.bkp ]; then
      cp -R ~/.local/state/nvim/ ~/.local/state/nvim.bkp
    fi
    rm -rf ~/.local/state/nvim
  fi
  git clone https://github.com/NvChad/starter ~/.config/nvim
}

stow_dots() {
  echo "Backing up old files and stowing new ones..."

  if [ -d ~/.config/nvim ]; then
    rm -rf ~/.config/nvim
  fi

  if [ ! -d "$MATUGEN_DIR" ]; then
    mkdir -p "$MATUGEN_DIR"/templates
  fi

  if [ ! -L "$MATUGEN_DIR"/templates/colors-pywal ] || [ "$(readlink -f "$MATUGEN_DIR/templates/colors-pywal")" != "$INSTALL_DIR/matugen-template/colors-pywal" ]; then
    backup="$MATUGEN_DIR"/templates/colors-pywal.bkp
    if [ ! -e "$backup" ]; then
      cp "$MATUGEN_DIR/templates/colors-pywal" "$backup"
    fi
    rm -rf "$MATUGEN_DIR/templates/colors-pywal"
  fi

  if [ -e "$MATUGEN_DIR"/config.toml ]; then
    python3 "$INSTALL_DIR"/adjustMatugenToml.py
  fi

  stow --target="$HOME"/.config/matugen/templates --dir="$INSTALL_DIR" matugen-template
  stow --target="$HOME" --dir="$INSTALL_DIR" dots
}

clone_repo
clone_nvchad
nvim
stow_dots
nvim

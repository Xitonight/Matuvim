#!/usr/bin/env bash

set -e
set -u
set -o pipefail

MATUVIM_DIR=${1:-"$HOME/.matuvim"}
if ! grep -q "export MATUVIM_DIR" ~/.zshrc; then
  echo "export MATUVIM_DIR=\"$MATUVIM_DIR\"" >>~/.zshrc
fi

MATUGEN_DIR="$HOME/.config/matugen"
REPO_URL="https://github.com/Xitonight/Matuvim"

clone_repo() {
  if [ -d "$MATUVIM_DIR" ]; then
    echo "Updating Matuvim..."
    git -C "$MATUVIM_DIR" pull
  else
    echo "Cloning Matuvim..."
    git clone "$REPO_URL" "$MATUVIM_DIR"
  fi
}

clone_nvchad() {
  echo "Cloning NvChad, neovim will open shortly, do not touch anything..."

  if [ -d ~/.config/nvim/ ]; then
    if [ ! -e ~/.config/nvim.bak ]; then
      cp -R ~/.config/nvim/ ~/.config/nvim.bak
    fi
    rm -rf ~/.config/nvim
  fi
  if [ -d ~/.local/share/nvim/ ]; then
    if [ ! -e ~/.local/share/nvim.bak ]; then
      cp -R ~/.local/share/nvim/ ~/.local/share/nvim.bak
    fi
    rm -rf ~/.local/share/nvim
  fi
  if [ -d ~/.local/state/nvim/ ]; then
    if [ -e ~/.local/state/nvim.bak ]; then
      cp -R ~/.local/state/nvim/ ~/.local/state/nvim.bak
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

  if [ ! -L "$MATUGEN_DIR"/templates/colors-pywal ] || [ "$(readlink -f "$MATUGEN_DIR/templates/colors-pywal")" != "$MATUVIM_DIR/matugen-template/colors-pywal" ]; then
    backup="$MATUGEN_DIR"/templates/colors-pywal.bak
    if [ ! -e "$backup" ]; then
      cp "$MATUGEN_DIR/templates/colors-pywal" "$backup"
    fi
    rm -rf "$MATUGEN_DIR/templates/colors-pywal"
  fi

  if [ -e "$MATUGEN_DIR"/config.toml ]; then
    python3 "$MATUVIM_DIR"/adjustMatugenToml.py
  fi

  stow --target="$HOME"/.config/matugen/templates --dir="$MATUVIM_DIR" matugen-template
  stow --target="$HOME" --dir="$MATUVIM_DIR" dots
}

clone_repo
clone_nvchad
nvim
stow_dots
nvim

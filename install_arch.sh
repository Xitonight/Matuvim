#!/usr/bin/env bash

set -e
set -u
set -o pipefail

INSTALL_DIR=${1:-"$HOME/neoconf"}
MATUGEN_DIR="$HOME/.config/matugen"
REPO_URL="https://github.com/Xitonight/neoconf"

install_aur_helper() {
  if ! command -v git &>/dev/null; then
    sudo pacman -Sy git
  fi
  aur_helper=""
  if command -v yay &>/dev/null; then
    aur_helper="yay"
    echo $aur_helper
  elif command -v paru &>/dev/null; then
    aur_helper="paru"
    echo $aur_helper
  else
    echo "Installing yay-bin..."
    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay-bin.git "$tmpdir/yay-bin"
    cd "$tmpdir/yay-bin"
    makepkg -si --noconfirm
    cd - >/dev/null
    rm -rf "$tmpdir"
    aur_helper="yay"
  fi
}

install_packages() {
  echo "Installing required packages..."
  grep -v '^$' "$INSTALL_DIR"/requirements.lst | sed '/^#/d' | $aur_helper -Syy --noconfirm --needed -
}

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
      mv ~/.config/nvim/ ~/.config/nvim.bkp
    else
      rm -rf ~/.config/nvim
    fi
  fi
  if [ -d ~/.local/share/nvim/ ]; then
    if [ ! -e ~/.local/share/nvim.bkp ]; then
      mv ~/.local/share/nvim/ ~/.local/share/nvim.bkp
    else
      rm -rf ~/.local/share/nvim
    fi
  fi
  if [ -d ~/.local/state/nvim/ ]; then
    if [ -e ~/.local/state/nvim.bkp ]; then
      mv ~/.local/state/nvim/ ~/.local/state/nvim.bkp
    else
      rm -rf ~/.local/state/nvim
    fi
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
      mv "$MATUGEN_DIR/templates/colors-pywal" "$backup"
    else
      rm -rf "$MATUGEN_DIR/templates/colors-pywal"
    fi
  fi

  if [ -e "$MATUGEN_DIR"/config.toml ]; then
    python3 "$INSTALL_DIR"/adjustMatugenToml.py
  fi

  stow --target="$HOME"/.config/matugen/templates --dir="$INSTALL_DIR" matugen-template
  stow --target="$HOME" --dir="$INSTALL_DIR" dots
}

install_npm() {
  source /usr/share/nvm/init-nvm.sh
  nvm install node
  nvm use node
}

clone_repo
install_aur_helper
install_packages
install_npm
clone_nvchad
nvim
stow_dots
nvim

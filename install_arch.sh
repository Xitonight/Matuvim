#!/usr/bin/env bash

set -e
set -u
set -o pipefail

MATUVIM_DIR=${1:-"$HOME/.matuvim"}
if ! grep -q "export MATUVIM_DIR" ~/.zshrc; then
  echo "export MATUVIM_DIR=\"$MATUVIM_DIR\"" >>~/.zshrc
fi

BACKUP_DIR="$HOME/.nvim.bak"
MATUGEN_DIR="$HOME/.config/matugen"
REPO_URL="https://github.com/Xitonight/Matuvim"

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
  grep -v '^$' "$MATUVIM_DIR"/requirements.lst | sed '/^#/d' | $aur_helper -Syy --noconfirm --needed -
}

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
      cp -R ~/.config/nvim/ "$BACKUP_DIR/.config/nvim"
    fi
    rm -rf ~/.config/nvim
  fi
  if [ -d ~/.local/share/nvim/ ]; then
    if [ ! -e ~/.local/share/nvim.bak ]; then
      cp -R ~/.local/share/nvim/ "$BACKUP_DIR/.local/share/nvim"
    fi
    rm -rf ~/.local/share/nvim
  fi
  if [ -d ~/.local/state/nvim/ ]; then
    if [ -e ~/.local/state/nvim.bak ]; then
      cp -R ~/.local/state/nvim/ "$BACKUP_DIR/.local/state/nvim"
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

  if [ -e "$MATUGEN_DIR"/templates/colors-pywal ]; then
    if [ ! -L "$MATUGEN_DIR"/templates/colors-pywal ] || [ "$(readlink -f "$MATUGEN_DIR/templates/colors-pywal")" != "$MATUVIM_DIR/matugen-template/colors-pywal" ]; then
      backup="$BACKUP_DIR"/templates/colors-pywal.bak
      if [ ! -e "$backup" ]; then
        cp "$MATUGEN_DIR/templates/colors-pywal" "$backup"
      fi
      rm -rf "$MATUGEN_DIR/templates/colors-pywal"
    fi
  fi

  if [ -e "$MATUGEN_DIR"/config.toml ]; then
    python3 "$MATUVIM_DIR"/adjustMatugenToml.py
  fi

  stow --target="$HOME"/.config/matugen/templates/ --dir="$MATUVIM_DIR" matugen-template
  stow --target="$HOME" --dir="$MATUVIM_DIR" dots
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

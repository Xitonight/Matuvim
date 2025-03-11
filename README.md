# Neoconf ⚠️ WIP ⚠️

----------

This is nothing but a really simple Neovim setup based on [NvChad](https://nvchad.com/) with some tweaks.

## Installation

----------

### Requisites

Make sure you have [GNU stow](https://www.gnu.org/software/stow/) installed.
The package is available on pretty much every Linux package manager, so just install it like you would install any other package.

Some plugins might also need [npm](https://www.npmjs.com), and i'd suggest to get it using the [node version manager](https://github.com/nvm-sh/nvm), which again, should be available on your package manager.

Once you have installed the required packages, run those commands:

```bash
git clone https://github.com/Xitonight/neoconf
cd neoconf
chmod +x ./install.sh
./install.sh```

This will create a **backup** folder containing your old dotfiles if you had any.
The script will use stow, so it won't copy the files to your ~/.config folder, it will only create symlinks to the files inside the cloned repo, so make sure not to delete it after the installation (unless you want to manually copy the files).

> [!BUG]
> For some reason it is pretty common to get an error due to base46 not cloning all the resources needed. In case you get an error regarding some missing files from base64 just rerun the installation script.

## Uninstalling

----------

Run these 3 commands:

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim```

If you need any help feel free to open an issue or to contact me directly :)

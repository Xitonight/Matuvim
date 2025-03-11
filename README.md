# Neoconf ⚠️ WIP ⚠️

This is nothing but a really simple Neovim setup based on [NvChad](https://nvchad.com/) with some tweaks.

## Installation

### On Arch Linux

On Arch Linux you can use a custom installation script i wrote.
Simply run this command:

```bash
curl -fsSL https://raw.githubusercontent.com/Xitonight/neoconf/main/install.sh | bash
```

This will automatically create a **backup** folder containing your old dotfiles if you had any.

> [!NOTE]
> The script will use stow, so it won't copy the files to your ~/.config folder, it will only create symlinks to the files inside the cloned repo, so make sure not to delete it after the installation (unless you want to manually copy the files).

### Requisites

Make sure you have installed all the required packages, else the config might not work as expected.
All the packages should be available on your Linux package manager, so install them like you would install any other package.

- [GNU stow](https://www.gnu.org/software/stow/)
- [npm](https://www.npmjs.com), (i'd suggest to install npm through the usage of [node version manager](https://github.com/nvm-sh/nvm))
- [matugen](https://github.com/InioX/matugen) 
- [python-watchdog](https://pypi.org/project/watchdog/)
- [pywal](https://github.com/dylanaraps/pywal) 

----------

Once you have installed the required packages, run these commands, but first make sure to backup your old dotfiles:

```bash
mkdir nvim.bkp
cp -r ~/.config/nvim/ ~/.local/share/nvim/ ~/.local/state/nvim ./nvim.bkp
```

```bash
git clone https://github.com/Xitonight/neoconf
cd neoconf
stow --target=$HOME dots
```

> [!WARNING]
> For some reason it is pretty common to get an error due to base46 not cloning correctly all the resources needed. In case you get an error regarding some missing files from base64 just rerun the installation script.

## Uninstalling

Run these 3 commands:

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
```

And uninstall the packages, that's it.

If you need any help feel free to open an issue or to contact me directly :)

# Neoconf ⚠️ WIP ⚠️

This is nothing but a really simple Neovim setup based on [NvChad](https://nvchad.com/) and [NvChad's pywal](https://github.com/NvChad/pywal) by [Axenide](https://github.com/Axenide) with some tweaks.

<h2><sub><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Camera%20with%20Flash.png" alt="Camera with Flash" width="25" height="25" /></sub> Screenshots</h2>
<table align="center">
  <tr>
    <td colspan="4"><img src="assets/1.png"></td>
  </tr>
  <tr>
    <td colspan="1"><img src="assets/2.png"></td>
    <td colspan="1"><img src="assets/3.png"></td>
    <td colspan="1" align="center"><img src="assets/4.png"></td>
    <td colspan="1" align="center"><img src="assets/5.png"></td>
  </tr>
</table>

## Backing up your files

> [!CAUTION]
> Installing this dotfiles will overwrite your pre-existing dotfiles so make sure to backup your configuration if you don't want to lose it!

Folders that you might be interested in backing up:
- `~/.config/nvim/`
- `~/.local/share/nvim/`
- `~/.local/state/nvim/`

### Little F.A.Q. about this

> "Why don't you implement an automatic backup system? / Will you ever implement one?"

The answer is and will probably always be no. Everyone could have different ways to handle dotfiles and i can't make a universal script for it.
Actually, i could, but it's a pain in the arse. So please backup your files however you might find to be more comfortable and then proceed with installation.

## Installation

### On Arch Linux

On Arch Linux you can use a custom installation script i wrote.
Simply run this command:

```bash
curl -fsSL https://raw.githubusercontent.com/Xitonight/neoconf/main/install.sh | bash
```

> [!NOTE]
> The script will use stow, so it won't copy the files to your ~/.config folder, it will only create symlinks to the files inside the cloned repo, so make sure not to delete it after the installation (unless you want to manually copy the files).

### On other distros

Make sure you have installed all the required packages, else the config might not work as expected.
All the packages should be available on your Linux package manager, so install them like you would install any other package.

- [GNU stow](https://www.gnu.org/software/stow/)
- [npm](https://www.npmjs.com), (i'd suggest to install npm through the usage of [node version manager](https://github.com/nvm-sh/nvm))
- [matugen](https://github.com/InioX/matugen) 
- [python-watchdog](https://pypi.org/project/watchdog/)
- [pywal](https://github.com/dylanaraps/pywal) 

Once you have installed the required packages, run these commands:

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
```

This will clone NvChad, open neovim and all the required plugins for NvChad to work.
After it's done installing close neovim (escape the maze) and run these commands to finish the installation:

```bash
git clone https://github.com/Xitonight/neoconf
cd neoconf
stow --target=$HOME dots
nvim
```

----------

> [!WARNING]
> For some reason it is pretty common to get an error due to base46 not cloning correctly all the resources needed. In case you get an error regarding some missing files from base64 just rerun the installation script / follow the guide again.

## Uninstalling

Run these 3 commands:

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
```

And uninstall the packages, that's it.

If you need any help feel free to open an issue or to contact me directly :)

## Credits

I want to thank [Axenide](https://github.com/Axenide) for this absurdly well done plugin and for all i've learnt from him.

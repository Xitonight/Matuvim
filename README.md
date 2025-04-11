<h1><img src="https://logosrated.net/wp-content/uploads/parser/Neovim-Logo-1.png" alt="Neovim logo" width="25" height="25"/> Neoconf</h1>

This is nothing but a really simple Neovim setup based on [NvChad](https://nvchad.com/) and [NvChad's pywal](https://github.com/NvChad/pywal) by [Axenide](https://github.com/Axenide) with some tweaks.

The objective of this is to ship a bundled config with lots of languages available out of the box with LSPs, formatters, custom snippets (since i don't like the ones provided by NvChad's default config) and other really useful plugins i find to be indispensable, such as [nvim-surround](https://github.com/kylechui/nvim-surround), which is not available on NvChad's default config.

**Implemented languages:**
- Bash
- CSS
- C++
- HTML
- JSON
- Lua
- Python
- Prisma scheme files
- Svelte
- Tailwindcss (classes)
- Typescript / Javascript
- Toml

<h2><sub><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Camera%20with%20Flash.png" alt="Camera with Flash" width="25" height="25" /></sub> Screenshots</h2>

<table align="center">
  <tr>
    <td colspan="3"><img src="assets/1.png"></td>
  </tr>
  <tr>
    <td colspan="1"><img src="assets/2.png"></td>
    <td colspan="1"><img src="assets/3.png"></td>
    <td colspan="1"><img src="assets/4.png"></td>
  </tr>
</table>

<h2><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Package.png" alt="Package" width="25" height="25" /> Installation</h2>

> [!IMPORTANT]
> **The script will open Neovim twice!** The first time will be just after installing NvChad, you'll have to close neovim after it finishes to let the script continue and open Neovim again!

> [!WARNING]
> Both the scripts will use stow, so they won't copy the files to your ~/.config folder, they will only create symlinks to the files inside the cloned repo, so make sure not to delete it after the installation (unless you want to manually copy the files).

> [!TIP]
> You can pass `/path/to/installation` to the script to change the default install directory (`~/neoconf`)

<h3><img src="http://wiki.installgentoo.com/images/f/f9/Arch-linux-logo.png" width=22 height=22/> On Arch Linux</h3>

On Arch Linux you'll only need to run the installation script, as it'll do everything for you. It'll backup the files automatically to `<path/to/the/file>.bkp` and it will automatically install all the required packages.

```bash
curl -fsSLO https://raw.githubusercontent.com/Xitonight/neoconf/main/install_arch.sh && chmod +x ./install_arch.sh && ./install_arch.sh
```

<h3><img src="http://wiki.installgentoo.com/images/5/5b/Ubuntu.png" width=22 height=22/> On other distros</h3>

Make sure you have installed all the required packages, else the script won't work.
All the packages should be available on your Linux package manager, so install them like you would install any other package.

- [GNU stow](https://www.gnu.org/software/stow/)
- [swww](https://github.com/LGFae/swww)
- [npm](https://www.npmjs.com), (i'd suggest to install npm through the usage of [node version manager](https://github.com/nvm-sh/nvm))
- [matugen](https://github.com/InioX/matugen) 
- [python-watchdog](https://pypi.org/project/watchdog/)
- [python-toml]( https://pypi.org/project/toml/ )
- [pywal](https://github.com/dylanaraps/pywal) 

Once every package has been installed, run the script:

```bash
curl -fsSLO https://raw.githubusercontent.com/Xitonight/neoconf/main/install.sh && chmod +x ./install.sh && ./install.sh
```

<h2><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Symbols/Information.png" alt="Information" width="25" height="25" /> Usage</h2>

Now that everything's installed, every time you run `matugen image <path_to_your_wallpaper>` you'll see that neovim will use a fresh new color scheme based on your wallpaper. 

<h2><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Symbols/Cross%20Mark.png" alt="Cross Mark" width="25" height="25" /> Uninstalling</h2>

Run these commands:

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.config/matugen/templates/colors-pywal
```

And uninstall the packages, that's it.

If you need any help feel free to open an issue or to contact me directly :)

<h2><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Smilies/Red%20Heart.png" alt="Red Heart" width="25" height="25" /> Credits</h2>

I want to thank [Axenide](https://github.com/Axenide) for this absurdly well done plugin and for all i've learnt from him.

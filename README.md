# My Dotfiles

This contains various configuration files (dotfiles) for setting up a new Linux machine.
It largely assume an Arch Linux based system.
I took insparation from various sources and I will try, when my memory serves, to cite those wonderful users for their effort, my memory, and the use of anyone else who may read this.
This is largely for Linux, but there may be remnants of some Mac OS elements in the `.zshrc`.

## Contents:

[zsh](.zshrc)
[compton](compton.conf)
[neovim](config/nvim/init.vim)
[i3](config/i3/config)
[polybar](config/polybar/config)
[zathura](config/zathura)
[ranger](config/ranger)

More will surely be added with time.

## Sources:

Much of the inspiration for my `i3` and `polybar` setups came from combinations of materials from [Derek Taylor](https://gitlab.com/dwt1/dotfiles), the [nord polybar theme](https://github.com/Yucklys/polybar-nord-theme), and [these dotfiles](https://github.com/cvignal/dotfiles). 
Inspiration for the `.zshrc` came from somewhere online ... 
I looked [here](https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/) for much of my [neovim](https://neovim.io/) configuration.

## Notes:

These are largely notes for me to document things I needed to install and why.

* [compton](https://github.com/chjj/compton/) - compisitor. Necessary for changing opacity of terminals when using `i3`.
* [nitrogen](https://wiki.archlinux.org/title/Nitrogen) - lightweight GUI for setting desktop background, for use with tiling manager DE like `i3`.
* [trizen](https://aur.archlinux.org/packages/trizen/) - simple pacman wrapper with AUR support
* [spotifyd](https://github.com/Spotifyd/spotifyd) - lightweight Spotify daemon
* [spotify-tui](https://github.com/Rigellute/spotify-tui) - command line interface for Spotify
* [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - zsh theme
* [ranger](https://github.com/ranger/ranger) - terminal file manager
  * [ranger icons](https://github.com/alexanderjeurissen/ranger_devicons) - icons for ranger
* betterlockscreen - for powermenu and such things.
* `AUR: ttf-font-awesome` - some necessary fonts
* `oblogout` - logout / shutdown / restart session utility for polybar
* `nerd-fonts-complete`
* `xrdp` for polybar config
* `trizen -S --needed mesa-demos vulkan-tools` - necessary Vulkan drivers for using Steam Play / Proton
* Some [notes](https://pswu.dev/manjaro-on-macbook-pro/) for running on a Macbook.

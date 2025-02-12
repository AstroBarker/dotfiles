# My Dotfiles

This contains various configuration files (dotfiles) for setting up a new Linux machine.
It largely assume an Arch Linux based system.

These dotfiles are managed / installed with [GNU Stow](https://www.gnu.org/software/stow/).
Running `stow ${PKGNAME}` will symlink everything from `./$PKGNAME` to where it belongs.

## Installation
I use submodules to include dependencies. 
The best way to get the source is the following 
```sh
git clone --recursive https://github.com/AstroBarker/dotfiles
```

## Manual Install
- [Yay](https://github.com/Jguer/yay)
- [uv](https://github.com/astral-sh/uv) use `install_uv.sh`
- ...

## Notes:

These are largely notes for me to document things I might use and why.

What | Why
------------ | -------------
`kitty` | terminal emulator.
`alacritty` | terminal emulator.
`picom` | Composite manager. Needed for terminal opacity.
`betterlockscreen` | Nice, light lock screen. For powermenu.
`trizen` | AUR helper.
`yay` | AUR helper.
`nitrogen` | lightweight GUI for setting desktop background.
`dunst`  | Notification daemon.
`rofi` | lightweight launcher app.
`pulseaudio-ctl` | for controlling audio.
`blueman` | bluetooth controller.
`spotifyd` | lightweight Spotify daemon.
`spotify-tui` | CLI for Spotify.
`gtk` | GUI support.
`i3-gaps` | My window manager of choice at the moment. 
`neofetch` | Script that displays info about the system.
`nvim` | NeoVim. Fork of Vim. Best text editor (?).
`polybar` | Status bar.
`xrdp` | Used for settings in polybar.
`ranger` | Lightweight terminal-based file manager.
`ranger icons` | icons for ranger
`zathura` | PDF, EPUB and CBR viewer. Lovely.
`zsh` | Zsh shell.
`powerlevel10k` | responsive zsh theme.
`delta` | git syntax highlighter
`slides` | terminal slideshow
`tidy` | html formatter
`ruff` | python linter/formatter from Astral-sh
`uv` | Rust based pip alternative from Astral-sh
`jabref` | bibtex gui, tooling, reference manager
`feh` | image viewer
`bibtex-tidy` | bibtex formatter

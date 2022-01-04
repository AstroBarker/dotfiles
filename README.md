# My Dotfiles

This contains various configuration files (dotfiles) for setting up a new Linux machine.
It largely assume an Arch Linux based system.
This is largely for Linux, but there may be remnants of some Mac OS elements in the `.zshrc`.

## Contents:

[zsh](.zshrc)
[compton](.compton.conf)
[neovim](config/nvim/init.vim)
[i3](config/i3/config)
[polybar](config/polybar/config)
[zathura](config/zathura)
[ranger](config/ranger)
[rofi](config/rofi)
[dunst](config/dunst)
[kitty](config/kitty)

More will surely be added with time.

## Notes:

These are largely notes for me to document things I needed to install and why.

What | Why
------------ | -------------
`kitty` | terminal emulator.
`compton` | Composite manager. Needed for terminal opacity.
`betterlockscreen` | Nice, light lock screen. For powermenu.
`trizen` | AUR helper.
`nitrogen` | lightweight GUI for setting desktop background.
`dunst`  | Notification daemon.
`rofi` | lightweight launcher app.
`pulseaudio-ctl` | for controlling audio.
`blueman` | bluetooth controller.
`spotifyd` | lightweight Spotify daemon.
`spotify-tui` | CLI for Spotify.
`gtk` | Sometimes I use GUI apps. That's what this is about.
`i3-gaps` | My window manager of choice at the moment. 
`neofetch` | Config for script that displays info about the system.
`nvim` | NeoVim. Fork of Vim. Best text editor (?).
`polybar` | Status bar.
`xrdp` | Used for settings in polybar.
`ranger` | File explorer that can display pictures on the terminal.
`[ranger icons](https://github.com/alexanderjeurissen/ranger_devicons)` | icons for ranger
`zathura` | PDF, EPUB and CBR viewer. Lovely.
`zsh` | Zsh shell.
`powerlevel10k` | responsive zsh theme.

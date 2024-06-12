#!/bin/env bash
# taken from https://github.com/UpalBarua/.config

# Options for powermenu
lock="  Lock "
logout="  Logout "
shutdown="  Shutdown "
reboot="  Reboot "
sleep="   Sleep "

# Get answer from user via rofi
selected_option=$(echo "$lock
$logout
$sleep
$reboot
$shutdown" | rofi -dmenu\
                  -i\
                  -p "Power"\
                  -config "~/.config/rofi/config.rasi"\
                  -font "FiraCode Nerd Font 12"\
                  -width "15"\
                  -lines 5\
                  -line-margin 3\
                  -line-padding 10\
                  -scrollbar-width "0" )

# Do something based on selected option
if [ "$selected_option" == "$lock" ]
then
    betterlockscreen -l dim 
    # /home/$USER/.config/bspwm/scripts/i3lock-fancy/i3lock-fancy.sh
elif [ "$selected_option" == "$logout" ]
then
    i3-msg exit
elif [ "$selected_option" == "$shutdown" ]
then
    systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
    systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
    betterlockscreen -l dim &
    systemctl suspend
else
    echo "No match"
fi

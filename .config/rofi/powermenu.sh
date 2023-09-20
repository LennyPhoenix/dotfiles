#!/bin/env bash

# Options for powermenu
lock=" 󰌾  Lock"
logout=" 󰍃  Logout"
shutdown=" 󰐥  Shutdown"
reboot=" 󰜉  Reboot"
sleep=" 󰏤  Sleep"
hibernate=" 󰤄  Hibernate"

# Get answer from user via rofi
selected_option=$(echo "$lock
$sleep
$hibernate
$logout
$reboot
$shutdown" | rofi -dmenu\
                  -i\
                  -p "Action"\
                  -config "~/.config/rofi/powermenu.rasi"\
                  -font "Symbols Nerd Font Mono 14"\
                  -lines 6\
                  -line-margin 1\
                  -line-padding 15\
                  -scrollbar-width "0" )

# Do something based on selected option
if [ "$selected_option" == "$lock" ]
then
    smokescreen
elif [ "$selected_option" == "$logout" ]
then
    bspc quit
elif [ "$selected_option" == "$shutdown" ]
then
    systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
    systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
    systemctl suspend
elif [ "$selected_option" == "$hibernate" ] 
then
    systemctl hibernate
else
    echo "No match"
fi

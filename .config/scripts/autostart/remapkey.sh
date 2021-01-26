# Keyboard
setxkbmap -option "shift:both_capslock"
setxkbmap -option "caps:ctrl_modifier"
xcape -e "Caps_Lock=Escape"
xinput set-prop "PS/2 Generic Mouse" "libinput Accel Speed" 1
#setxkbmap -option "caps:swapescape"
xmodmap $HOME/.config/scripts/autostart/rekeyin
sleep 1s && xset r rate 233 23

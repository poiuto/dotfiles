# Keyboard
setxkbmap -option "shift:both_capslock"
setxkbmap -option "caps:ctrl_modifier"
xcape -e "Caps_Lock=Escape"
#setxkbmap -option "caps:swapescape"
xmodmap $HOME/Documents/autostart/rekeyin
sleep 1s && xset r rate 233 23

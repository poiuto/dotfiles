# Keyboard
setxkbmap -option "caps:backspace"
setxkbmap -option "shift:both_capslock"
xmodmap $HOME/Documents/autostart/rekeyin
sleep 1s && xset r rate 233 23

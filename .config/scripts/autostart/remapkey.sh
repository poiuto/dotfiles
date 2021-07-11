# Keyboard
setxkbmap -option shift:both_capslock
# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps
# make short-pressed Ctrl behave like Escape:
killall xcape || true && xcape -e 'Control_L=Escape'
#setxkbmap -option "caps:swapescape"
xmodmap $HOME/.config/scripts/autostart/rekeyin
sleep 1s && xset r rate 233 23

export EDITOR="nvim"
export BROWSER="firefox"
export TERMINAL="kitty"

if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep i3 || startx
fi

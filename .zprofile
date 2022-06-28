export EDITOR="nvim"
export BROWSER="firefox"
export TERMINAL="kitty"
export FILE="lf"
export MAIN_MONITOR="DP-3"
# export MAIN_MONITOR="eDP-1"

LF_ICONS=$(sed ~/.config/lf/icons \
            -e '/^[ \t]*#/d'       \
            -e '/^[ \t]*$/d'       \
            -e 's/[ \t]\+/=/g'     \
            -e 's/$/ /')
LF_ICONS=${LF_ICONS//$'\n'/:}
export LF_ICONS

if pacman -Qs libxft-bgra >/dev/null 2>&1; then
	# start graphical server on user's current tty if not already running.
	[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx
else
	echo "\033[31mIMPORTANT\033[0m: Note that \033[32m\`libxft-bgra\`\033[0m must be installed for this build of dwm.
Please run:
	\033[32myay -S libxft-bgra-git\033[0m
and replace \`libxft\`. Afterwards, you may start the graphical server by running \`startx\`."
fi

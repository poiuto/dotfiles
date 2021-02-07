export EDITOR="nvim"
export BROWSER="firefox"
export TERMINAL="kitty"
export FILE="lf"

export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT4_IM_MODULE=ibus
export CLUTTER_IM_MODULE=ibus
#ibus-daemon -drx

# This is the list for lf icons:
#export LF_ICONS="di=📁:\
#fi=📃:\
#tw=🤝:\
#ow=📂:\
#ln=⛓:\
#or=❌:\
#ex=🎯:\
#*.txt=✍:\
#*.mom=✍:\
#*.me=✍:\
#*.ms=✍:\
#*.png=🖼:\
#*.webp=🖼:\
#*.ico=🖼:\
#*.jpg=📸:\
#*.jpe=📸:\
#*.jpeg=📸:\
#*.gif=🖼:\
#*.svg=🗺:\
#*.tif=🖼:\
#*.tiff=🖼:\
#*.xcf=🖌:\
#*.html=🌎:\
#*.xml=📰:\
#*.gpg=🔒:\
#*.css=🎨:\
#*.pdf=📚:\
#*.djvu=📚:\
#*.epub=📚:\
#*.csv=📓:\
#*.xlsx=📓:\
#*.tex=📜:\
#*.md=📘:\
#*.r=📊:\
#*.R=📊:\
#*.rmd=📊:\
#*.Rmd=📊:\
#*.m=📊:\
#*.mp3=🎵:\
#*.opus=🎵:\
#*.ogg=🎵:\
#*.m4a=🎵:\
#*.flac=🎼:\
#*.wav=🎼:\
#*.mkv=🎥:\
#*.mp4=🎥:\
#*.webm=🎥:\
#*.mpeg=🎥:\
#*.avi=🎥:\
#*.mov=🎥:\
#*.mpg=🎥:\
#*.wmv=🎥:\
#*.m4b=🎥:\
#*.flv=🎥:\
#*.zip=📦:\
#*.rar=📦:\
#*.7z=📦:\
#*.tar.gz=📦:\
#*.z64=🎮:\
#*.v64=🎮:\
#*.n64=🎮:\
#*.gba=🎮:\
#*.nes=🎮:\
#*.gdi=🎮:\
#*.1=ℹ:\
#*.nfo=ℹ:\
#*.info=ℹ:\
#*.log=📙:\
#*.iso=📀:\
#*.img=📀:\
#*.bib=🎓:\
#*.ged=👪:\
#*.part=💔:\
#*.torrent=🔽:\
#*.jar=♨:\
#*.java=♨:\
#"

#bash -c "$HOME/.config/scripts/autostart/remapkey.sh"

if pacman -Qs libxft-bgra >/dev/null 2>&1; then
	# Start graphical server on user's current tty if not already running.
	[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx
else
	echo "\033[31mIMPORTANT\033[0m: Note that \033[32m\`libxft-bgra\`\033[0m must be installed for this build of dwm.
Please run:
	\033[32myay -S libxft-bgra-git\033[0m
and replace \`libxft\`. Afterwards, you may start the graphical server by running \`startx\`."
fi

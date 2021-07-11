#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled"	1
# xinput set-prop "SynPS/2 Synaptics TouchPad"	"libinput Tapping Drag Enabled"	1
# xinput set-prop "SynPS/2 Synaptics TouchPad"	"libinput Tapping Drag Lock Enabled"	0
# xinput set-prop "SynPS/2 Synaptics TouchPad"	"libinput Tapping Button Mapping Enabled"	1, 0
# xinput set-prop "SynPS/2 Synaptics TouchPad"	"libinput Natural Scrolling Enabled"	1
# xinput set-prop "SynPS/2 Synaptics TouchPad"	"libinput Disable While Typing Enabled"	0
# libinput Disable While Typing Enabled Default
# xinput set-prop "SynPS/2 Synaptics TouchPad"	"libinput Accel Speed"	0.5

# xinput set-prop "PS/2 Generic Mouse" "libinput Accel Speed" 1

exec i3
# exec awesome
#exec xfce4-session

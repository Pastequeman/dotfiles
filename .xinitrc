#!/usr/bin/env sh
#
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

# load xresource
[[ -f ~/.Xresources]] && xrdb -merge -I$HOME ~/.Xresources

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi


dunst &
exec i3

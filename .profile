#!/usr/bin/env sh

if [[ -f "${HOME}/.bashrc" ]]; then
     source "${HOME}/.bashrc"
fi
   
# colorfull man pages
export LESS_TERMCAP_mb=$(tput bold; tput setaf 4) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 5)
export LESS_TERMCAP_so=$(tput bold; tput rev; tput setaf 3) # yellow
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
export LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_me=$(tput sgr0)

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd ~/.config/mpd/mpd.conf

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi

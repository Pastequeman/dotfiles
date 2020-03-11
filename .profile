[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$PATH:/home/julien/bin/"
export READER="zathura"
#export QT_QPA_PLATFORMTHEME="qt5ct"
export TERMINAL="termite"
export BROWSER="brave"
export EDITOR="emacs"
export COLORTERM="truecolor"
#export TERM=screen-256color
export PAGER="less"
export WM="i3"

# Start blinking
export LESS_TERMCAP_mb=$(tput bold; tput setaf 4) # green
# Start bold
export LESS_TERMCAP_md=$(tput bold; tput setaf 5) # green
# Start stand out
export LESS_TERMCAP_so=$(tput bold; tput rev; tput setaf 3) # yellow
# End standout
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# Start underline
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
# End Underline
export LESS_TERMCAP_ue=$(tput sgr0)
# End bold, blinking, standout, underline
export LESS_TERMCAP_me=$(tput sgr0)

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd ~/.config/mpd/mpd.conf

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi

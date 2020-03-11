neofetch

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

stty -ixon # Disable ctrl-s and ctrl-q.

HISTSIZE= HISTFILESIZE= # Infinite history.
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

##### Bash options ######
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s cdspell            # 
shopt -s autocd             # automatically cd
shopt -s histappend         # longer history

###### alias ######
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias more='less'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias dl='cd /run/media/julien/SP\ PHD\ U3/NIES'

bind 'set completion-ignore-case on'

export CALIBRE_USE_SYSTEM_THEME=1

# file extraction: usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

neofetch

# If not runnig interactcely, don't do anything
[[ $- != *i* ]] && return

stty -ixon # Disable ctrl-s and ctrl-q.


# Load alias and shell config
for f in ~/.config/shellconfig/*; do source "$f"; done

##### Bash options ######
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s cdspell            # 
shopt -s autocd             # automatically cd
shopt -s histappend         # longer history

bind 'set completion-ignore-case on'

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

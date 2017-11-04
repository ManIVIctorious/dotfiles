# If not running interactively, do not do anything
[[ $- != *i* ]]  && return
[[ -z "$TMUX" ]] && exec tmux

set -o vi

shopt -s autocd                     # Prepend cd to directory names automatically
export HISTSIZE=500000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignorespace:ignoredups
export EDITOR=vim

# set the default prompt to colors and to display if previous command has failed
export PS1='$(if [[ $? == 0 ]]; then echo "\[\033[0;32m\]✓"; else echo "\[\033[0;31m\]✗"; fi) \[\e[0;1m\][\u@\h \W]\$ \[\e[m\]' 

# aliases for the ls command
alias  ls='ls      --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias  ll='ls -lh  --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias  la='ls -A   --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias lla='ls -lhA --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias  li='ls -lhi --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'

alias cp="cp -i"
alias df='df -h'
alias du='du -h'
alias grep='grep --color=tty -d skip'
alias find='find -regextype grep'

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"    ;;
      *.tar.gz)    tar xzf "$1"    ;;
      *.bz2)       bunzip2 "$1"    ;;
      *.rar)       unrar x "$1"    ;;
      *.gz)        gunzip "$1"     ;;
      *.tar)       tar xf "$1"     ;;
      *.tbz2)      tar xjf "$1"    ;;
      *.tgz)       tar xzf "$1"    ;;
      *.zip)       unzip "$1"      ;;
      *.Z)         uncompress "$1" ;;
      *.7z)        7z x "$1"       ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#retemp - temporarily reset size of /tmp
#usage retemp new Size (e.g. 10G)
function retemp {
  if [ $# -ne 1 ]
  then
    echo "Function needs exactly one parameter, the new size of /tmp (e.g. 10G)"
  else
  sudo mount -o remount,size=$1,noatime /tmp
  fi
}

#allusers - Get list of all installed users
function allusers {
    cat /etc/passwd | cut -d: -f1
}

#wsrm - white space remover
#usage: wsrm <file(s)>
wsrm(){
  for FILE in "${@}"
  do
    mv -v "$FILE" `echo "$FILE" | tr ' ' '_'`
  done
}

#leo - LeoDictionary
#requires w3m to be installed
#usage: leo <searched-word(Ger or En)>
leo(){
 w3m -dump "http://pda.leo.org/?search=\"$*\"" | sed -n -e :a -e '1,9!{P;N;D;};N;ba' | sed -e '1,14d'
}

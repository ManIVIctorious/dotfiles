# set vi input mode
set -o vi
export EDITOR=nvim

# Prepend cd to directory names automatically
shopt -s autocd

# History preferences
export HISTSIZE=500000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignorespace:ignoredups

# set the default prompt
#   if previous command was successful display green ✓, else display red ✗
export PS1='$(if [[ $? == 0 ]]; then echo "\[\e[0;32m\]✓"; else echo "\[\e[0;31m\]✗"; fi)'" \[\e[0;1m\][\u@\h \W]\$ \[\e[m\]"

# source aliases and functions
alias_dir=/home/manuel/.dotfiles/bash_aliases
 func_dir=/home/manuel/.dotfiles/bash_functions
if [ -d ${alias_dir} ]; then
  for i in ${alias_dir}/*; do
    source $i
  done
fi
if [ -d ${func_dir} ]; then
  for i in ${func_dir}/*; do
    source $i
  done
fi

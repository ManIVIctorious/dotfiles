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

# source aliases, functions and host specific exports placed in
#   ${dotfiles_dir}/bash_aliases
#   ${dotfiles_dir}/bash_functions
#   ${dotfiles_dir}/exports
# , respectively
dotfiles_dir=
if [ -d ${dotfiles_dir} -a -n ${dotfiles_dir} ]; then
  for i in ${dotfiles_dir}/{bash_aliases/*.alias,bash_functions/*.func,exports/*.export}; do
    if [ -f $i ]; then
      source $i
    fi
  done
fi

# hints:
# !!    shortcut for previous command
# !!*   shortcut for previous command's parameters

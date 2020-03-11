#!/bin/bash

# list of files to be linked
list=(
    bashrc
    inputrc
    profile
    screenrc
    tmux.conf
    toprc
    xinitrc
)

# set path to dotfiles in bashrc
sed -i "s+\(dotfiles_dir=\).*$+\1${PWD}+" bashrc

# link all files in list to ${HOME}/.<entry>
for i in ${list[@]} ; do
  ln -s ${PWD}/$i ${HOME}/.${i}
done

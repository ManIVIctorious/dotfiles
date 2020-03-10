#!/bin/bash

# list of files to be linked
list=(
    bashrc
    inputrc
    profile
    toprc
    xinitrc
)

# set appropriate paths for alias and function directory
sed -i "s+\(alias_dir=\).*$+\1${PWD}/bash_aliases+"   bashrc
sed -i  "s+\(func_dir=\).*$+\1${PWD}/bash_functions+" bashrc

# link all files in list to ${HOME}/.<entry>
for i in ${list[@]} ; do
  ln -s ${PWD}/$i ${HOME}/.${i}
done

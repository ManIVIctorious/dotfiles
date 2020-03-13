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

# create bashrc by concatenating (host specific) exports, proto.bashrc, aliases and functions
if [ -d exports        ]; then bashfiles+=( $(find "exports/" -name "*.export" | sort) ); fi
bashfiles+=(proto.bashrc)
if [ -d bash_aliases   ]; then bashfiles+=( $(find "bash_aliases/" -name "*.alias"  | sort) ); fi
if [ -d bash_functions ]; then bashfiles+=( $(find "bash_functions/" -name "*.func" | sort) ); fi
cat "${bashfiles[@]}" > bashrc

# link all files in list to ${HOME}/.<entry>
for i in ${list[@]} ; do
  ln -s ${PWD}/$i ${HOME}/.${i}
done

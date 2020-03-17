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

# basedir (location of install.sh script)
basedir=${0%/*}
if [ -z ${basedir} ]; then basedir="."; fi

# create bashrc by concatenating (host specific) exports, proto.bashrc, aliases and functions
if [ -d "${basedir}/exports"        ]; then bashfiles+=( $(find "${basedir}/exports/"        -name "*.export" | sort) ); fi
bashfiles+=("${basedir}/proto.bashrc")
if [ -d "${basedir}/bash_aliases"   ]; then bashfiles+=( $(find "${basedir}/bash_aliases/"   -name "*.alias"  | sort) ); fi
if [ -d "${basedir}/bash_functions" ]; then bashfiles+=( $(find "${basedir}/bash_functions/" -name "*.func"   | sort) ); fi
cat "${bashfiles[@]}" > "${basedir}/bashrc"

# link all files in list to ${HOME}/.<entry>
for i in ${list[@]} ; do
  ln -s "${basedir}/${i}" "${HOME}/.${i}"
done

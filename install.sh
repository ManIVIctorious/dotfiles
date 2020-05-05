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


## get basedir (location of install.sh script)
pushd . > /dev/null

  basedir="$0"

# if invoked by a symbolic link follow the link and get path
  if ([ -L "${basedir}" ]); then
    while [ -L "${basedir}" ]; do
      cd $(dirname "${basedir}")
      basedir=$(readlink "${basedir}")
    done
  fi

  cd $(dirname "${basedir}")
  basedir="${PWD}"

popd  > /dev/null


## create profile (expand some place holders from proto.profile to profile)
  proto="${basedir}/proto.profile"
profile="${basedir}/profile"
sed "s+__insert_flatpak_alias_dir__+${basedir}/flatpak.bin+" "${proto}" > "${profile}"


## create bashrc
# allowed file extensions are:
#   .export   (host specific) exports
#   .func     bash functions
#   .alias    bash aliases
# bash.head
headdir="${basedir}/bash.head"
if [ -d "${headdir}" ]; then
  bashfiles+=( $(find "${headdir}" -type f -name *.export | sort) )
  bashfiles+=( $(find "${headdir}" -type f -name *.func   | sort) )
  bashfiles+=( $(find "${headdir}" -type f -name *.alias  | sort) )
fi
# proto.bashrc
bashfiles+=( "${basedir}/proto.bashrc" )
# bash.tail
taildir="${basedir}/bash.tail"
if [ -d "${taildir}" ]; then
  bashfiles+=( $(find "${taildir}" -type f -name *.export | sort) )
  bashfiles+=( $(find "${taildir}" -type f -name *.func   | sort) )
  bashfiles+=( $(find "${taildir}" -type f -name *.alias  | sort) )
fi

cat "${bashfiles[@]}" > "${basedir}/bashrc"


# link all files in list to ${HOME}/.<entry>
for i in ${list[@]}; do
  ln -sf "${basedir}/${i}" "${HOME}/.${i}"
done

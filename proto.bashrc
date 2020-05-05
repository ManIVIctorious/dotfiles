# set vi input mode
set -o vi
export EDITOR=vim

# Prepend cd to directory names automatically
shopt -s autocd

# History preferences
export HISTSIZE=500000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignorespace:ignoredups

# set the default prompt
#   if previous command was successful display green ✓, else display red ✗
export PS1='$(if [[ $? == 0 ]]; then echo "\[\e[0;32m\]✓"; else echo "\[\e[0;31m\]✗"; fi)'" \[\e[0;1m\][\u@\h \W]\$ \[\e[m\]"

### Hints:
#
## Re-running commands:
#      !!       re-run previous command
#      !*       insert previous command's parameters
# ^<old>^<new>  run last command with first occurrence of <old> substituted by <new>
#               (e.g. "^ls^cd" after an ls command is identical to "cd !*")
#
## Directory stack:
#   cd    [dir] changes last directory in dir-stack (index 0)
#   pushd [dir] push dir on top of dir-stack and and cd to new index 0
#   popd  [+n]  remove n-th entry from dir-stack (default +0 removes top dir)
#   dirs  [-v]  print dir-stack (-v: line-wise with prefixed indices)
#   ~[:digit:]  while ~ expands to the home directory ~[number] expands to
#               the respective entry in the dir-stack before command exectution
#               and can therefore be used by any program
#
## Misc:
#   unset       remove alias, shell function or variable (reverse of export)


## Base aliases for the GNU core utils
# editor
  alias vi="${EDITOR}"
  alias vim="${EDITOR}"

# aliases for the ls command
  alias  ls='ls       --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
  alias  ll='ls -lh   --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
  alias  lt='ls -lhrt --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
  alias  la='ls -A    --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
  alias lla='ls -lhA  --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
  alias  li='ls -lhi  --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'

# colorisation of CLI
  alias diff='diff --color=auto'
  alias grep='grep --color=auto -d skip'

# provide the histg (history grep) command
  alias histg='history | grep'

# settings for less:
  # source code highlighting for less, requires source-highlight package
  export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
  # make search smartcase (-i)
  # use colors in pager (-R)
  # enable mouse wheel scrolling (--mouse)
  # set scroll width to 3 lines per tic (--wheel-lines=3)
  export LESS='-iR --mouse --wheel-lines=3'

# set default values for find (requires which to prevent infinite recursion)
  function find { $(which find) "$@" -regextype grep; }

# display load average by using the "load" command
  function load { awk '{print $1,$2,$3}' /proc/loadavg; }; export -f load

# additional aliases
  alias cp="cp -i"

#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Here Cinnamon is kept as default
session=${1:-cinnamon}

case $session in
    awsome)        exec awesome;;
    enlightenment) exec enlightenment_start;;
    fluxbox)       exec startfluxbox;;
    gnome)         exec gnome-session;;
    kde)           exec startkde;;
    openbox)       exec openbox-session;;
    xfce)          exec startxfce4;;
    cinnamon)      exec cinnamon-session;;
    # No known session, try to run it as command
    *) exec $1;;                
esac


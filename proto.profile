
# set special paths
export MyLocalPath=${HOME}/.local/bin
export PATH=$PATH:${MyLocalPath}
export PKG_CONFIG_PATH=${HOME}/src/pkgconfig/

# add flatpak export directory and internal shorthand directory to path
export PATH=${PATH}:/var/lib/flatpak/exports/bin
export PATH=${PATH}:__insert_flatpak_alias_dir__

# set gtk client side decorations and qt style
export GTK_CSD=1
export QT_STYLE_OVERRIDE=breeze

# run sway if logged in on tty2
if [ "$(tty)" = "/dev/tty2" ]; then
    if [ -f "/usr/bin/sway" ]; then
    # set backends to wayland
        export QT_QPA_PLATFORM=wayland
        export SDL_VIDEODRIVER=wayland
        exec sway
    fi
fi

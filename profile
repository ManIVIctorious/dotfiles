
# set special paths
export MyLocalPath=${HOME}/.local/bin
export PATH=$PATH:${MyLocalPath}
export PKG_CONFIG_PATH=${HOME}/src/pkgconfig/

# set gtk client side decorations and qt style
export GTK_CSD=1
export QT_STYLE_OVERRIDE=breeze

# enable touch screen support in firefox
export MOZ_USE_XINPUT2=1

# run sway if logged in on tty2
if [ "$(tty)" = "/dev/tty2" ]; then
    if [ -f "/usr/bin/sway" ]; then
    # set backends to wayland
#       export GDK_BACKEND=wayland
        export MOZ_ENABLE_WAYLAND=1
        export QT_QPA_PLATFORM=wayland
        export SDL_VIDEODRIVER=wayland
        exec sway
    fi
fi

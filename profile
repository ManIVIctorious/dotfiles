
# set special paths
export MyLocalPath=${HOME}/.local/bin
export PATH=$PATH:${MyLocalPath}
export PKG_CONFIG_PATH=${HOME}/src/pkgconfig/

# set gtk client side decorations and qt style
export GTK_CSD=1
export QT_STYLE_OVERRIDE=breeze

# enable touch screen support in firefox
export MOZ_USE_XINPUT2=1

#!/bin/bash

DIR=`pwd`

BACKUPDIR="$HOME/.config/backup"
CONFIGDIR="$HOME/.config"
FONTSDIR="$HOME/.local/share/fonts"


if [[ "$1" == "--laptop" ]]; then
	FLAVOR="dotfiles-laptop"
	setup

elif [[ "$1" == "--desktop" ]]; then
	FLAVOR="dotfiles-desktop"
	setup

else
	cat <<- EOF
	Usage : install-arch.sh --flavor
		
	Available Flavors :
	--laptop
	--desktop
	EOF
fi


setup() {
    echo "[>] Installing required packages"
    deps_install_arch

    echo "[>] Installing patched fonts"
    [[ ! -d "$FDIR" ]] && mkdir -p "$FONTSDIR"
    cp -rf $DIR/fonts/* "$FONTSDIR"

    echo "[>] Trying to backup your old configuration to: $BACKUPDIR"

    mkdir -p "$BACKUPDIR"
    mv -R "$CONFIGDIR/bspwm" "$BACKUPDIR"
    mv -R "$CONFIGDIR/kitty" "$BACKUPDIR"
    mv -R "$CONFIGDIR/polybar" "$BACKUPDIR"
    mv -R "$CONFIGDIR/rofi" "$BACKUPDIR"
    mv -R "$CONFIGDIR/sxhkd" "$BACKUPDIR"

    mv "$HOME/.Xresources" "$BACKUPDIR"
    mv "$HOME/.gtkrc-2.0" "$BACKUPDIR"

    echo "[>] Installing configs"

    cp "$DIR/$FLAVOR/.Xnord" "$HOME/.Xnord"
    cp "$DIR/$FLAVOR/.Xresources" "$HOME/.Xresources"
    cp "$DIR/$FLAVOR/.gtkrc-2.0" "$HOME/.gtkrc-2.0"

    mkdir -p "$DIR/$FLAVOR/bspwm"
    mkdir -p "$DIR/$FLAVOR/kitty"
    mkdir -p "$DIR/$FLAVOR/polybar"
    mkdir -p "$DIR/$FLAVOR/rofi"
    mkdir -p "$DIR/$FLAVOR/sxhkd"

    cp -R "$DIR/$FLAVOR/bspwm" "$CONFIGSDIR"
    cp -R "$DIR/$FLAVOR/kitty" "$CONFIGSDIR"
    cp -R "$DIR/$FLAVOR/polybar" "$CONFIGSDIR"
    cp -R "$DIR/$FLAVOR/rofi" "$CONFIGSDIR"
    cp -R "$DIR/$FLAVOR/sxhkd" "$CONFIGSDIR"

    mv "$DIR/$FLAVOR/.Xresources" "$HOME"
    mv "$DIR/$FLAVOR/.gtkrc-2.0" "$HOME"

    exit 0
}

deps_install_arch() {
    sudo pacman -Sy bspwm sxhkd sddm kitty flameshot xcompmgr feh rofi polybar dunst wmname git
}

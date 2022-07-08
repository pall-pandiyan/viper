#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

[ -f "$HOME/.config/envrc" ] && . "$HOME/.config/envrc"

[ -f "$HOME/.config/aliasrc" ] && . "$HOME/.config/aliasrc"

[ -f "$HOME/.config/autostartrc" ] &&  . "$HOME/.config/autostartrc"


# see https://unix.stackexchange.com/a/295652/332452
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# see https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
mkdir -p "$HOME/.local/share/keyrings"

i3

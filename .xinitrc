#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession

# from clipmenu 
# https://github.com/cdown/clipmenu
systemctl --user import-environment DISPLAY
clipmenud &
# Swap caps lock and escape
xmodmap ~/.xmodmap

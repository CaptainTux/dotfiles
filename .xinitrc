#!/bin/sh
#
# ~/.xinitrc
# Executed by startx
# By calling this with arguments we can start different sessions
# eg. startx ~/.xinitrc i3  or  startx ~/.xinitrc bspwm
# simply using startx, openbox is set as the default

# session=${1:-openbox}

# session=bsp

# source files in /etc/X11/xinit/xinitrc.d
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && "$f"
    done
    unset f
fi

# this must be before the 'exec' command
# it sources ~/.xprofile for additional settings
[ -f ~/.xprofile ] && ~/.xprofile

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap

# i am root lockscreen
xss-lock -l -- i3lock -n -f -i ~/.lock.png &

# start the session
# case $session in
#     i3|i3wm) 
#         exec i3
#         ;;
#     bsp|bspwm)
#         exec bspwm
#         ;;
#     awesome)
#         exec awesome
#         ;;
#     xfce|xfce4) 
#         exec startxfce4
#         ;;
#     openbox|openbox-session) 
#         exec openbox-session
#         ;;
#     *) 
#         exec $1
#         ;;

wmname LG3D

exec xmonad


# esac

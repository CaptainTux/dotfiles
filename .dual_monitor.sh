#!/bin/sh

if xrandr | grep "HDMI2 connected"; then # dual monitor
    xrandr --output eDP1 --auto --primary --output HDMI2 --auto --left-of eDP1
    # bspc monitor eDP1 -d I II III IV
    # bspc monitor HDMI2 -d V VI VII VIII IX X
    #    bspc rule -a Emacs desktop=^2 state=tiled
    #    bspc rule -a Firefox desktop=^1 state=tiled
    #    bspc rule -a Waterfox desktop=^1 state=tiled
else
    xrandr --auto
    # bspc monitor eDP1 -d I II III IV V VI VII VIII IX X
fi

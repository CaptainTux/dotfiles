#!/usr/bin/bash

# Description=Runs pscircle to continuously update desktop wallpaper

# if xrandr | grep "HDMI2 connected"; then # dual monitor
#     while true;
#     do ~/.config/pscircle/wallpaper_dual.sh;
#        sleep 30; done
# else
while true;
do ~/.config/pscircle/wallpaper.sh;
   sleep 30; done
# fi

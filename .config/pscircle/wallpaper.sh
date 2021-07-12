#!/bin/bash

set -e

pscircle \
    --background-color=000000 \
    --link-color-min=a58ce533 \
    --link-color-max=ff8ce533 \
    --dot-color-min=4394ba \
    --dot-color-max=ff0090 \
    --tree-font-size=15 \
    --tree-font-color=94bfd1 \
    --tree-font-face="Noto Sans" \
    --tree-radius-increment=200 \
    --link-convexity=0.6 \
    --link-width=2.5 \
    --toplists-row-height=20 \
    --toplists-font-size=16 \
    --toplists-font-color=C8D2D7 \
    --toplists-pid-font-color=7B9098 \
    --toplists-font-face="Siji" \
    --toplists-bar-height=8 \
    --toplists-bar-background=444444 \
    --toplists-bar-color=7d54dd \
    --collapse-threads=true \
    --max-children=35 \
    --memlist-center=-800:-400 \
    --cpulist-center=700:-400 \
    --output-width=1920 \
    --output-height=1080 \
    --tree-sector-angle=-3.1415 \
    --tree-rotate=true \
    --tree-rotation-angle=0 \
    --tree-center=0:500 \
    --background-image=/home/$USER/.random_wallpaper.png

# --background-color=1e2226 \

## pscircle \
##     --background-color=000000 \
##     --link-color-min=375143a0 \
##     --link-color-max=375143 \
##     --dot-color-min=ff1ab3 \
##     --dot-color-max=ff1ab3 \
##     --tree-font-size=15 \
##     --tree-font-color=94bfd1 \
##     --tree-font-face="Noto Sans" \
##     --tree-radius-increment=200 \
##     --link-convexity=0.6 \
##     --link-width=2.5 \
##     --toplists-row-height=20 \
##     --toplists-font-size=16 \
##     --toplists-font-color=C8D2D7 \
##     --toplists-pid-font-color=7B9098 \
##     --toplists-font-face="Siji" \
##     --toplists-bar-height=8 \
##     --toplists-bar-background=444444 \
##     --toplists-bar-color=7d54dd \
##     --collapse-threads=true \
##     --max-children=35 \
##     --memlist-center=-800:-400 \
##     --cpulist-center=700:-400 \
##     --output-width=1920 \
##     --output-height=1080 \
##     --tree-sector-angle=-3.1415 \
##     --tree-rotate=true \
##     --tree-rotation-angle=0 \
##     --tree-center=0:500 \
##     --background-image=/home/arch/Pictures/gentoo_v2.png
 

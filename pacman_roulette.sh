#!/bin/sh

pacman -S $(pacman -Slq | LANG=C sort -R | head -n $((RANDOM % 10)))

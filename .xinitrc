 ##!/bin/bash

# Ensure numlock is on
numlockx on &

# set keyboard repeat rate
xset r rate 250 45

# set high dpi for retina displays
xrandr --dpi 144

# Fix Java Applications
# https://wiki.archlinux.org/index.php/Java#Non-reparenting_window_managers_.2F_Grey_window_.2F_Programs_not_drawing_properly
export _JAVA_AWT_WM_NONREPARENTING=1

# Bspwm Window Manager
exec bspwm -c $HOME/.config/bspwm/bspwmrc
# exec awesome


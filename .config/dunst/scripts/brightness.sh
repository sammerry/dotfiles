#!/bin/bash
# changeVolume
# https://wiki.archlinux.org/index.php/Dunst#Scripting

# Arbitrary but unique message id
msgId="991088"

# Query amixer for the current volume and whether or not the speaker is muted
brightness="$(light)"
dunstify -a "changeVolume" -u low -i preferences-system-brightness-lock -r "$msgId" "$brightness"


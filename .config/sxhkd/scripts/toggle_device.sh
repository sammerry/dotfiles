#!/bin/bash
# https://github.com/Danboe/xinput-toggle.sh

device_re="\b.+id=([0-9]+).+\b"
device_id=11

if [ $# -eq 1 ] ; then
    if [[ $(xinput --list | grep $1) =~ $device_re ]] ; then
        id="${BASH_REMATCH[1]}"
        status=$(xinput list-props $1 | grep "Device Enabled" | grep -o "[01]$")
        xinput set-prop $id "Device Enabled" $((1-$status))
    else
        echo "Error: No xinput device matching '$1'"
    fi
else
    echo "Usage: xinput-toggle.sh <device-name>"
fi


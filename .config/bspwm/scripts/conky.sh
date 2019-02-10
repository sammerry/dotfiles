wifi=$(iwconfig 2>&1 | grep ESSID | sed 's/.*ESSID:"\(.*\)\"/\1/')
song=$(bash -c /home/lappy/.config/bspwm/scripts/mopidy.sh)
fallback="$wifi"
echo ${song:-$wifi}

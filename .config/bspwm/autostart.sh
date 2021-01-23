#! /bin/bash

$HOME/.screenlayout/home.sh

# Refresh user specific crontab
crontab $HOME/.config/crontab/crontab

# Set the wallpaper
echo "${HOME}/Pictures/wallpaper/bash.png" > /tmp/wallpaper

# Themes And Opacity
wal -a 90 --theme $HOME/.config/wal/colorschemes/dark/mine.json &

# Load the wal colors from above
. $HOME/.cache/wal/colors.sh

# Load Xresources File
xrdb $HOME/.Xresources &

# Swap Keys
xmodmap $HOME/.Xmodmap &

# Set the wallpaper
hsetroot -center $(cat /tmp/wallpaper)   -tint '#088b95' -gamma 0.7 &

# Key Bindings
sxhkd &

# Enable Notifications
dunst \
-lb "$background" -lf "$foreground" -lfr "$color5" \
-nb "$background" -nf "$foreground" -nfr "$color4" \
-cb "$background" -cf "$foreground" -cfr "$color6" &

# Pagerduty Notifications
PAGERDUTY_TOKEN=$(cat /home/lappy/Data/pagerduty/token) \
  pager-pull -i 5 --icon 'computer-fail' &

# Save your eyes
redshift &

# Urxvt Daemon
urxvtd -q -o -f &

# Addon conky desktop hud
conky -c $HOME/.config/bspwm/system-overview

# Compton opacity and animations
compton --config $HOME/.config/bspwm/compton.conf &

# Screen Writer
# gromit-mpx -k none &

# Euclid Window Balancing
/home/lappy/.bin/euclid_balancer &

# Notify on dotfile change
dotfiles ls | \
  awk '{print "'$(echo $HOME/)'", $1;}' | \
  sed 's/\s//g' | \
  entr -p dunstify -i utilities-tweak-tool "Dotfiles" "Dotfile edited" &


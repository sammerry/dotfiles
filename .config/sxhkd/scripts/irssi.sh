#! /bin/bash
# touch $HOME/.irssi/fnotify
# tail -f $HOME/.irssi/fnotify | xargs -n 1 -d '\n' notify-send &
tail -n1 -f $HOME/.irssi/fnotify | xargs -n 1 -d '\n' notify-send &
byobu -u new -A -s irssi 'exec irssi'

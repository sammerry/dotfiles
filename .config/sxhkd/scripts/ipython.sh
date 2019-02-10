#!/bin/bash
tmux new -A -s ipython 'exec bash -i -c "clear && source /opt/anaconda/bin/activate && ipython"'

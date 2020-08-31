 ###......................................................................###
 ###                                                                      ###
 ###         /\//  __        ____  ___   _____ __  ______  ______         ###
 ###       //\/ _/_/       / __ )/   | / ___// / / / __ \/ ____/          ###
 ###          _/_/        / __  / /| | \__ \/ /_/ / /_/ / /               ###
 ###        _/_/    _    / /_/ / ___ |___/ / __  / _, _/ /___             ###
 ###       /_/     (_)  /_____/_/  |_/____/_/ /_/_/ |_|\____/             ###
 ###                                                                      ###
 ###......................................................................###
 ###                                                                      ###
 ###                               .do-"""""'-o..                         ###
 ###                             .o""            ""..                     ###
 ###                           ,,''                 ``b.                  ###
 ###                          d'                      ``b                 ###
 ###                         d`d:                       `b.               ###
 ###                        ,,dP                         `Y.              ###
 ###                       d`88                           `8.             ###
 ### ooooooooooooooooood888`88'                            `88888888888bo,###
 ###d                    Y:d8P                              8,          `b###
 ###8                    P,88b                             ,`8           8###
 ###8                   ::d888,                           ,8:8.          8###
 ###:                   dY88888                           `' ::          8###
 ###:                   8:8888                               `b          8###
 ###:                   Pd88P',...                     ,d888o.8          8###
 ###:                   :88'dd888888o.                d8888`88:          8###
 ###:                  ,:Y:d8888888888b             ,d88888:88:          8###
 ###:                  :::b88d888888888b.          ,d888888bY8b          8###
 ###                    b:P8;888888888888.        ,88888888888P          8###
 ###                    8:b88888888888888:        888888888888'          8###
 ###                    8:8.8888888888888:        Y8888888888P           8###
 ###,                   YP88d8888888888P'          ""888888"Y            8###
 ###:                   :bY8888P"""""''                     :            8###
 ###:                    8'8888'                            d            8###
 ###:                    :bY888,                           ,P            8###
 ###:                     Y,8888           d.  ,-         ,8'            8###
 ###:                     `8)888:           '            ,P'             8###
 ###:                      `88888.          ,...        ,P               8###
 ###:                       `Y8888,       ,888888o     ,P                8###
 ###:                         Y888b      ,88888888    ,P'                8###
 ###:                          `888b    ,888888888   ,,'                 8###
 ###:                           `Y88b  dPY888888OP   :'                  8###
 ###:                             :88.,'.   `' `8P-"b.                   8###
 ###:                              )8P,   ,b '  -   ``b                  8###
 ###:                             :':   d,'d`b, .  - ,db                 8###
 ###:                             `b. dP' d8':      d88'                 8###
 ###:                              '8P" d8P' 8 -  d88P'                  8###
 ###:                             d,' ,d8'  ''  dd88'                    8###
 ###:                            d'   8P'  d' dd88'8                     8###
 ###                            ,:   `'   d:ddO8P' `b.                   8###
 ###                    ,dooood88: ,    ,d8888""    ```b.                8###
 ###                 .o8"'""""""Y8.b    8 `"''    .o'  `"""ob.           8###
 ###                dP'         `8:     K       dP''        "`Yo.        8###
 ###               dP            88     8b.   ,d'              ``b       8###
 ###               8.            8P     8""'  `"                 :.      8###
 ###              :8:           :8'    ,:                        ::      8###
 ###              :8:           d:    d'                         ::      8###
 ###:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::####

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Fix Java Applications
# https://wiki.archlinux.org/index.php/Java#Non-reparenting_window_managers_.2F_Grey_window_.2F_Programs_not_drawing_properly
export _JAVA_AWT_WM_NONREPARENTING=1

# remove duplicates from history
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=1000
export HISTFILESIZE=2000

#shopt
shopt -s checkwinsize     # check window size after command
shopt -s checkjobs        # check running jobs before closing shell
shopt -s autocd           # change to named directory
shopt -s cdspell          # autocorrects cd misspellings
shopt -s cmdhist          # save multi-line commands in history as single line
shopt -s dotglob          # include hidden files in file expansion
shopt -s histappend       # do not overwrite history
shopt -s expand_aliases   # expand aliases
shopt -s globstar         # deep match on **
shopt -s lithist          # save multi line with newlines in history
shopt -s no_empty_cmd_completion

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# bash completion if'n ya got it
if [[ -f /usr/share/git/git-prompt.sh ]]; then
  GIT_COMPLETION_PATH=/usr/share/git/git-prompt.sh
  . $GIT_COMPLETION_PATH
  GIT_PS1_SHOWDIRTYSTATE=true # */+ for dirty
  GIT_PS1_SHOWSTASHSTATE=true # $ for stashes
  GIT_PS1_SHOWUNTRACKEDFILES=true # % for untracked
fi

# grep
export GREP_COLOR='1;36'

# ps1 prompt
export PS1="${special}\[\033[1;30m\]["    # gray:  "["
PS1="$PS1\`if [ \$? = 1 ]; then echo \[\e[31m\]x\[\e[0m\]; fi\` " # ugly but dose the trick
PS1="$PS1\[\033[1;36m\]\u"                # blue:  $user_name
PS1="$PS1\[\033[37m\]@"                   # white: "@"
PS1="$PS1\[\033[1;36m\]\H"                # cyan:  $host_name
PS1="$PS1\[\033[1;30m\]:"                 # gray:  ":"
PS1="$PS1\[\033[1;30m\]] "                # gray:  "] "
PS1="$PS1\[\033[0;32m\]\$(__git_ps1)"     # green: " *" + $git_branch
PS1="$PS1\[\033[1;37m\] : "               # white :
PS1="$PS1\[\e[33;1m\]\w"                  # yellow: $working_dir
PS1="$PS1\[\033[00m\]\n $ "               # gray:  "\n$ "

# custom ls colors
eval $(dircolors)
LS_DOCKER="*Dockerfile*=00;35:"
LS_VAGRANT="*Vagrantfile*=00;35:"
export LS_COLORS="$LS_COLORS$LS_DOCKER$LS_VAGRANT"

# Set vi mode in the terminal
set -o vi
export EDITOR=nvim
export BROWSER=qutebrowser


# Set Java Home
export JAVA_HOME=/usr/lib/jvm/openjdk

# Add Cargo Bin
export PATH="$HOME/.cargo/bin:$PATH"

# Set the config directory
export XDG_CONFIG_HOME=$HOME/.config

# Use vim as the standard editor
export EDITOR=vim

# set PATH for kubectl krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# set go env
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Print neofetch output
# neofetch
DATE=`date '+%A'`
# ln -f -s $HOME/Todo/todo.$DATE $HOME/todo
# cat $HOME/todo

# Ensure local bin takes presidence
export PATH="$HOME/.local/bin:$PATH"

# The next line updates PATH for the Azure Cloud SDK.
if [ -f '/home/lappy/lib/azure-cli/az.completion' ]; then . '/home/lappy/lib/azure-cli/az.completion'; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/lappy/google-cloud-sdk/path.bash.inc' ]; then . '/home/lappy/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/lappy/google-cloud-sdk/completion.bash.inc' ]; then . '/home/lappy/google-cloud-sdk/completion.bash.inc'; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/lappy/.mujoco/mujoco200/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/lappy/.mujoco/mjpro150/bin
export QT_QPA_PLATFORM=wayland

if [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi

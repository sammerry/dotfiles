alias userlist "cut -d: -f1 /etc/passwd"
alias ps "ps -aef --forest"
alias vim "nvim"
alias df "df -PHhl"
alias dotfiles "git --git-dir $HOME/.dotfiles/ --work-tree $HOME"

# Ctrl-r search
function __fzf_reverse_search
  history -z | fzf --tiebreak=index --height 40% --read0 | read -lz result; and commandline -- $result; commandline -f repaint
end
bind \cr '__fzf_reverse_search'

function __bang_bang
  commandline -t $history[1]; commandline -f repaint
end
alias !! __bang_bang

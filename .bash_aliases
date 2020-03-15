################################################################################
# Colors
################################################################################
alias ls='ls -GF --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias free="free -mt"
alias wget="wget -c"

################################################################################
# Convenience
###############################################################################
alias merge="xrdb -merge ~/.Xresources"
alias userlist="cut -d: -f1 /etc/passwd"
alias ps='ps -aef --forest'
alias vim='nvim'
alias curl='curl -w @$HOME/.config/curl/format.txt'

################################################################################
# Dotfile Management
###############################################################################
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

################################################################################
# EMR Hadoop FoxyProxy Example
###############################################################################
alias foxy-proxy='ssh -ND 8157 hadoop-batch'

################################################################################
# MySQL
################################################################################
alias mysql-web='MYSQL_HOME=$HOME/mysql.cnf ssh -nNL \
  3308:<remote mysql host>:3306 jump.bastionhost && \
  MYSQL_HOME=$HOME/Data/mysqlweb mysql'

################################################################################
# Dockerized
################################################################################

# Zipline Quant Work
alias ziplined='docker run --rm \
  --name zipline \
  -p 8888:8888 \
  -v $HOME/workspace/quantnb/notebooks/:/home/jovyan/ \
  ziplinetest'

# Kafkacat for dealing kafka streams
alias kafkacat='docker run --net host --rm -i \
  confluentinc/cp-kafkacat kafkacat'

# kSQL, port forward the ksql server to your local then
alias ksql='docker run --net host -i --rm \
  confluentinc/cp-ksql-cli:5.0.0-beta180702222458'

# use csvkit to generate sql from csv
alias csvsql='docker run --rm -i --net host \
  sammerry/csvkit /usr/bin/csvsql'

# use csvkit to convert to csv
alias in2csv='docker run --rm -i \
  sammerry/csvkit /usr/local/bin/in2csv'

# use csvkit to convert csv to json
alias csvjson='docker run --rm  -i \
  sammerry/csvkit /usr/local/bin/csvjson'

################################################################################
# IRC
################################################################################

# ZNC irc bouncer, you'll have to generate a config. Use the steps from the readme
# https://github.com/Stanback/alpine-bitlbee-znc/
alias znc-config='docker run -it \
  --rm --name znc-config \
  -v $HOME/Data/znc:/znc-data \
  znc:1.7.2-slim --makeconf'

alias znc='docker run -d \
  --rm --name=znc \
  -v /etc/localtime:/etc/localtime:ro \
  -v $HOME/Data/znc:/znc-data \
  --link=bitlbee:bitlbee \
  -p 6697:6697 \
  znc'

# Bitlbee Messenger, Slack, Hangouts to IRC
# https://github.com/Stanback/alpine-bitlbee-znc
alias bitlbee='docker run -d \
  --rm --name bitlbee \
  -v $HOME/Data/bitlbee:/var/lib/bitlbee \
  sammerry/bitlbee'

################################################################################
# MUSIC
################################################################################

# Note process ID for audio must match local system to run as non root user
alias mopidy='docker run -d --rm \
  --name mopidy --device /dev/snd \
  --ipc=host \
  --privileged \
  -v $HOME/.config/mopidy:/var/lib/mopidy/.config/mopidy/ \
  -v /tmp/mopidy:/tmp/mopidy \
  -p 6600:6600/tcp -p 6680:6680/tcp -p 5555:5555/udp \
  wernight/mopidy'


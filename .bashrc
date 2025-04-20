PS1=' \[\e[32m\]\w\[\e[0m\] \\$ '

export PATH=$PATH:~/bin
export EDITOR=helix
export CC=clang
export CXX=clang++

alias hx=helix
alias objdump='objdump -M intel'
alias ls='ls --group-directories-first --color=auto -h'
alias mpv='mpv --no-audio-display --volume=50 --loop-playlist=inf'

[ -f "/home/bo1led-owl/.ghcup/env" ] && . "/home/bo1led-owl/.ghcup/env" # ghcup-env
. "$HOME/.cargo/env"

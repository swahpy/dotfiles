# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

# Begin setup for ble.sh
[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach

test -s ~/.alias && . ~/.alias || true

# . "$HOME/.cargo/env"
# alias
alias lsa='ls -al'
alias lsd='ls -adl ./*'
alias lgt='logout'
alias cl='clear'
alias rm='rm -rf'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tl='tmux ls'
alias v='nvim'
alias vim='nvim'
alias nvimconf='v ~/.config/nvim'

export PYENV_ROOT="$HOME/.submodules/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH:~/nvim-linux64/bin/"
eval "$(pyenv init -)"

# End setup for ble.sh
[[ ${BLE_VERSION-} ]] && ble-attach
eval "$(starship init bash)"

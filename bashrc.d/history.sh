#!/bin/bash

if [[ ! -d "$HOME/.bash_history.d" ]]; then
  mkdir -p "$HOME/.bash_history.d"
fi

HISTHOSTNAME=$(hostname -f)

export HISTFILE="$HOME/.bash_history.d/$HISTHOSTNAME" # for my roaming home dir (multiple systems)
export HISTTIMEFORMAT='%Y-%m-%d+%H:%M:%S  '           # timestamp my commands
export HISTSIZE=100000                                # keep an unreasonably large history
export HISTFILESIZE=100000

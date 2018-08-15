#!/bin/bash

if [[ ! -d "$HOME/.bash_history.d" ]]; then
  mkdir -p "$HOME/.bash_history.d"
fi

HISTHOSTNAME=$(hostname -f)

export HISTFILE="$HOME/.bash_history.d/$HISTHOSTNAME"
export HISTTIMEFORMAT='%Y-%m-%d+%H:%M:%S  '

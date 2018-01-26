#!/bin/bash

if [[ ! -d "$HOME/.bash_history.d" ]]; then
  mkdir -p "$HOME/.bash_history.d"
fi

if [[ -z "$HOSTNAME" ]]; then
  HOSTNAME=$(hostname -f)
fi

export HISTFILE="$HOME/.bash_history.d/$HOSTNAME"
export HISTTIMEFORMAT='%Y-%m-%d+%H:%M:%S  '

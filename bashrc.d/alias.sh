#!/bin/bash

#alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias l='ls -l'
alias l.='ls -lad .*'
alias ll='ls -la'
alias now='date +%Y%m%d%H%M%S'

if builtin command -v batcat &>/dev/null; then
  alias cat='batcat --decorations never --paging never'
elif builtin command -v bat &>/dev/null; then
  alias cat='bat --decorations never --paging never'
fi

if builtin command -v vagrant &>/dev/null; then
  alias v='vagrant'
fi

if builtin command -v kubectl &>/dev/null; then
  alias k='kubectl'
fi

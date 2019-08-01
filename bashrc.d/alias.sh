#!/bin/bash

#alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
if uname -s | grep -q Darwin; then # MacOS (BSD-based OS tools vs GNU coreutils)
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
fi
alias l='ls -l'
alias l.='ls -lad .*'
alias ll='ls -la'


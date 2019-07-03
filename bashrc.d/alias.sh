#!/bin/bash

#alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
if uname -s | grep -q Darwin; then # MacOS specific
  alias l='ls -lG'
  alias ll='if [[ $PWD == $HOME ]]; then ls -lG; else ls -laG; fi'
  alias ls='ls -G'
else
  alias l='ls -l --color=auto'
  alias ll='if [[ $PWD == $HOME ]]; then ls -l --color=auto; else ls -la --color=auto; fi'
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
fi

#!/bin/bash

#alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias l='ls -l --color=auto'
#alias ll='ls -lA --color=auto'
alias ll='if [[ $PWD == $HOME ]]; then ls -l --color=auto; else ls -la --color=auto; fi'
alias ls='ls --color=auto'

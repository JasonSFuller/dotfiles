#!/bin/bash

if [[ $- =~ i ]]; then stty -ixon; fi # disable ctrl-s and ctrl-q for interactive shells

if ! uname -s | grep -q Darwin; then # MacOS bash doesn't support these
  shopt -s autocd # cd into directories merely by typing the name
fi


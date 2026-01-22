#!/bin/bash

if [[ $- =~ i ]]; then stty -ixon; fi # disable ctrl-s and ctrl-q for interactive shells

shopt -s autocd # cd into directories merely by typing the name

function set_term_title {
  printf '\e]2;%s\a' "$*"
}

export set_term_title

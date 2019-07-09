#!/bin/bash

if [[ -d "$HOME/terraform" ]]; then
  if [[ ! "$PATH" =~ terraform ]]; then
    export PATH=$PATH:$HOME/terraform
  fi
  if which terraform &>/dev/null; then
    complete -C $(which terraform) terraform
  fi
fi

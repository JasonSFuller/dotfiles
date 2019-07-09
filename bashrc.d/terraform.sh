#!/bin/bash

if [[ -d "$HOME/terraform" && ! "$PATH" =~ terraform ]]; then
  export PATH=$PATH:$HOME/terraform
fi

if which terraform &>/dev/null; then
  complete -C /home/jfuller/terraform/terraform terraform
fi

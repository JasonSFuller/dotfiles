#!/bin/bash

if which terraform &>/dev/null; then
  complete -C $(which terraform) terraform
fi


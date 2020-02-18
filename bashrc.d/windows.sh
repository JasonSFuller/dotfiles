#!/bin/bash

# detect cygwin via the mingw terminal emulation (not ideal)
if [[ "$(uname -s)" =~ ^MINGW ]]; then
  echo "Ugh. I'm in Windows. Do 'special' things."
fi

# detect WSL1
# TODO differentiate between 1 and 2 somehow
if grep -qiE '^linux\b.*\b(microsoft|wsl)\b' /proc/version; then
  echo "Less painful, but still Windows."
  sudo service ssh status &> /dev/null
  if [[ $? -eq 3 ]]; then
    sudo service ssh start
  fi
fi

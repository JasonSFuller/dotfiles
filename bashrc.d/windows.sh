#!/bin/bash

# detect cygwin via the mingw terminal emulation (not ideal)
if [[ "$(uname -s)" =~ ^MINGW ]]; then
  echo "Ugh. I'm in Windows. Do 'special' things."
fi

# detect wsl
if grep -qiE '^linux\b.*\b(microsoft|wsl)\b' /proc/version; then
  # wsl2 (and windows terminal) is considerably less stupid, 
  # so if you find v2, do nothing.  otherwise, startup sshd.
  if ! grep -qiE '\bwsl2\b' /proc/version; then
    echo "Detected WSL; starting sshd..."
    sudo service ssh status &> /dev/null
    if [[ $? -eq 3 ]]; then
      sudo service ssh start
    fi
  fi
fi

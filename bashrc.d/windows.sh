#!/bin/bash

if [[ "$(uname -s)" =~ ^MINGW ]]; then
  echo "Ugh. I'm in Windows. Do 'special' things."
fi

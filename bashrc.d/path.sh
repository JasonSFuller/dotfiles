#!/bin/bash

# accepts an array of directories to be added to $PATH

function add_paths {
  #local dirs=$@
  local -n dirs="$1"
  local paths


  for dir in "${dirs[@]}"
  do
    if [[ ! -d "$dir" ]]; then continue; fi
    dir=$(echo "$dir" | tr -s / | sed 's:/$::')
    # $PATH is a string and not an array, so convert it for precision and safety
    IFS=$':' read -r -d '' -a paths <<< "$PATH"
    for path in "${paths[@]}"
    do
      if [[ "$dir" == "$path" ]]; then continue 2; fi
    done
    export PATH="$PATH:$dir"
  done
}

new_path_dirs=(
  "."
  "$HOME/bin"
  "$HOME/.local/bin"
)

# TODO BUG
#   "$HOME/.local/bin" gets duplicated (only twice) after subsequent runs,
#   ...maybe the tail of a loop is skipped?  to duplicate run bash then bash 
#   again and echo $PATH

add_paths new_path_dirs

unset -f add_path
unset -v new_path_dirs


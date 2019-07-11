#!/bin/bash

# accepts an array of directories to be added to $PATH

function add_paths {
  #local -n dirs="$1" # "-n" only in bash 4.3+
  local dirs=("$@")
  local paths

  for dir in "${dirs[@]}"
  do
    dir=$(echo "$dir" | tr -s / | sed 's:/$::') # remove extra+trailing slashes
    if [[ ! -d "$dir" ]]; then continue; fi
    # $PATH is a string and not an array, so convert it for precision and safety
    IFS=$':' read -r -d '' -a paths <<< "$PATH"
    for path in "${paths[@]}" # loop through $PATH
    do # and if the dir is already in $PATH, skip to the next $dir
      path="${path%%[[:space:]]*}" # trim trailing white space
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

add_paths "${new_path_dirs[@]}"

unset -f add_path
unset -v new_path_dirs


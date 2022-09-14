#!/bin/bash

dotfilesdir="${1:-src/dotfiles}"

function error { echo "ERROR: $1" >&2; exit 1; }
function warn  { echo "WARN: $1"; }
function info  { echo "INFO: $1"; }

if ! cd "$HOME"; then
  error "could not change dir to home ($HOME)"
fi
if [[ ! -d "$dotfilesdir" ]]; then
  error "directory does not exist ($dotfilesdir)"
fi

for file in bash_profile bashrc bashrc.d vim vimrc gitconfig inputrc; do
  src="$dotfilesdir/$file"
  dst=".$file"
  if [[ -h "$dst" ]]; then
    symlink="$(readlink "$dst")"
    warn "removing existing symlink '$dst' ($symlink)"
    rm "$dst"
  fi
  if [[ -f "$dst" || -d "$dst" ]]; then
    backup="$dst.$(date +%Y%m%d%H%M%S)"
    warn "backing up existing file/dir '$dst' ($backup)"
    if [[ -f "$dst" ]]; then echo "  diff -u '$HOME/$backup' '$HOME/$dst'"; fi
    mv "$dst" "$backup"
  fi
  if [[ -f "$src" || -d "$src" ]]; then
    info "linking $dst -> $src"
    ln -s "$src" "$dst"
  fi
done

echo
if [[ -f $HOME/.ssh/id_* ]]; then
  info "local ssh keys found"
fi
echo -e "\nIf this is a local machine (where you want ssh-agent running), run this:"
echo '   echo "$HOSTNAME" > "$HOME/.ssh/ssh-agent-hosts"'
echo

#!/bin/bash

if [[ -d /opt/chefdk ]]; then
  export EDITOR="vim"
  export PATH="/opt/chefdk/bin:$HOME/.chefdk/gem/ruby/2.4.0/bin:/opt/chefdk/embedded/bin:$PATH:/opt/chefdk/gitbin"
  export GEM_ROOT="/opt/chefdk/embedded/lib/ruby/gems/2.4.0"
  export GEM_HOME="$HOME/.chefdk/gem/ruby/2.4.0"
  export GEM_PATH="$HOME/.chefdk/gem/ruby/2.4.0:/opt/chefdk/embedded/lib/ruby/gems/2.4.0"
  _chef_comp() {
    local COMMANDS="exec env gem generate shell-init install update push push-archive show-policy diff provision export clean-policy-revisions clean-policy-cookbooks delete-policy-group delete-policy undelete verify"
    COMPREPLY=($(compgen -W "$COMMANDS" -- ${COMP_WORDS[COMP_CWORD]} ))
  }
  complete -F _chef_comp chef

fi


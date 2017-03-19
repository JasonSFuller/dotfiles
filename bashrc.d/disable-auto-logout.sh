#!/bin/bash

# IMPORTANT: This is not intended to be executed directly, even 
# though I've added a she-bang at the top.  $TMOUT is usually 
# set as readonly, which means you'll have to use gdb, and gdb 
# must attach to your login shell.  If run as a script, it will 
# be a child process and the TMOUT variable won't be unset 
# properly.  I could probably be more clever and find it, but 
# this "works for me" so... meh.

function killwithfire {
  if ! which gdb >&/dev/null; then
    echo "ERROR: gdb could not be found." >&2
    exit 1
  fi

gdb << EOF >&/dev/null
attach $$
call unbind_variable("TMOUT")
detach
quit
EOF

}

if [[ ! -z "$TMOUT" ]]; then
  unset TMOUT >&/dev/null
  if [[ $? -ne 0 ]]; then killwithfire; fi
  # 10 hours
  export TMOUT=36000
fi

unset killwithfire

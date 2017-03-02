#!/bin/bash

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

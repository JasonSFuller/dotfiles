# Is this an interactive shell?
if shopt -q login_shell && tty -s; then
  # Is PS1 empty or set to a default?
  #   '\s-\v\$ '    = bash default on RHEL systems
  #   '\h:\W \u\$ ' = MacOS default
  if [[ -z "$PS1" || "$PS1" == '\s-\v\$ ' || "$PS1" == '\h:\W \u\$ ' ]]; then
    PS1='[\u@\h \W]\$ '
  fi
fi


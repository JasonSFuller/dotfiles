function colorize_prompt {
  local red=$(tput setaf 1)
  local grn=$(tput setaf 2)
  local yel=$(tput setaf 3)
  local blu=$(tput setaf 4)
  local rst=$(tput sgr0)
  local host='\h'
  local user='\u'
  local wdir='\W'
  case "${HOSTNAME:3:1}" in # get 4th char
    [sStTdD]) host="${grn}${host}${rst}" ;; # sandbox, test, and dev
    [qQuU])   host="${yel}${host}${rst}" ;; # qa and uat
    [pP])     host="${red}${host}${rst}" ;; # prod
    *)
      if grep "^${HOSTNAME}\$" "$HOME/.ssh/ssh-agent-hosts" &>/dev/null; then 
        host="${blu}${host}${rst}" # my local pc
      fi
      ;;
  esac
  if [[ "${USER}" == 'root' ]]; then user="${red}${user}${rst}"; fi
  PS1="[${user}@${host} ${wdir}]\\$ "
}

# Is this an interactive shell?
if shopt -q login_shell && tty -s; then
  # Is PS1 empty or set to a default?
  #   '\s-\v\$ '    = bash default on RHEL systems
  #   '\h:\W \u\$ ' = MacOS default
  if [[ -z "$PS1" || "$PS1" == '\s-\v\$ ' || "$PS1" == '\h:\W \u\$ ' ]]; then
    PS1='[\u@\h \W]\$ '
  fi
  colorize_prompt
fi

unset -f colorize_prompt

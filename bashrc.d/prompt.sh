# NOTE: many of the checks here are borrowed directly from RHEL 7 /etc/bashrc

# Is this an interactive shell (with color)?
if shopt -q login_shell && tty -s; then
  # Is PS1 empty or set to a default?  If so, make it a little nicer.
  #   '\s-\v\$ '    = bash default on RHEL systems
  #   '\h:\W \u\$ ' = MacOS default
  if [[ -z "$PS1" || "$PS1" == '\s-\v\$ ' || "$PS1" == '\h:\W \u\$ ' ]]; then
    PS1='[\u@\h \W]\$ '
  fi
  # Find the 4th character in the hostname:
  #   ---green---  --yellow--   --red--
  #   s = sandbox  q = qa       p = prod
  #   t = test     u = uat
  #   d = dev
  # Or if you're my local PC (with my ssh-agent) = blue
  case "${HOSTNAME:3:1}" in
    [sStTdD]) PS1="$(tput setaf 2)$PS1$(tput sgr0)" ;; # green
    [qQuU])   PS1="$(tput setaf 3)$PS1$(tput sgr0)" ;; # yellow
    [pP])     PS1="$(tput setaf 1)$PS1$(tput sgr0)" ;; # red
    *)
      if grep "^${HOSTNAME}\$" "$HOME/.ssh/ssh-agent-hosts" &>/dev/null; then 
        PS1="$(tput setaf 6)$PS1$(tput sgr0)" # cyan
      fi
      ;;
  esac
fi

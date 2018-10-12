function load_ssh_agent {

  echo "loading agent..."
  ssh-agent > "$HOME/.ssh/ssh-agent"
  cat "$HOME/.ssh/ssh-agent"
  source "$HOME/.ssh/ssh-agent"

}

function check_ssh_agent {

  if [[ ! -d "$HOME/.ssh" ]]; then
    if ! install -m 755 -d "$HOME/.ssh"; then
      echo "ERROR: cannot create .ssh dir" >&2
      return 1
    fi
  fi

  if [[ ! -f "$HOME/.ssh/ssh-agent" ]]; then
    if ! touch "$HOME/.ssh/ssh-agent"; then
      echo "ERROR: cannot create ssh-agent env file" >&2
      return 1
    fi
  fi

  if [[ ! -r "$HOME/.ssh/ssh-agent" ]]; then
     echo "ERROR: cannot read ssh-agent env file" >&2
     return 1
  fi
    
  if [[ ! -w "$HOME/.ssh/ssh-agent" ]]; then
     echo "ERROR: cannot write ssh-agent env file" >&2
     return 1
  fi

  source "$HOME/.ssh/ssh-agent"

  if [[ -z "$SSH_AUTH_SOCK" ]]; then
    echo "INFO: \$SSH_AUTH_SOCK is empty"
    load_ssh_agent
    return
  fi 

  if [[ ! -S "$SSH_AUTH_SOCK" ]]; then
    echo "INFO: \$SSH_AUTH_SOCK is not a socket"
    load_ssh_agent
    return 
  fi

  if [[ -z "$SSH_AGENT_PID" ]]; then
    echo "INFO: \$SSH_AGENT_PID is empty"
    load_ssh_agent
    return
  fi

  if [[ ! "$SSH_AGENT_PID" =~ ^[0-9]+$ ]]; then
    echo "ERROR: \$SSH_AGENT_PID is non-numeric ($SSH_AGENT_PID)"
    return 1
  fi
    
  if ! grep -q ssh-agent "/proc/$SSH_AGENT_PID/cmdline"; then
    echo "INFO: PID ($SSH_AGENT_PID) not ssh-agent or not found"
    load_ssh_agent
    return
  fi
}

check_ssh_agent

unset load_ssh_agent
unset check_ssh_agent

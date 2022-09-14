#!/bin/bash

function load_ssh_agent {

  # if you're on a distro running a desktop with gnome keyring, check for the
  # daemon.  it should be started (by pam) when you login and $SSH_AUTH_SOCK
  # _should_ already be defined... BUT if you've made it here, the socket is 
  # invalid, so...
  if builtin command -v gnome-keyring-daemon &>/dev/null &&
     pgrep -f 'gnome-keyring-daemon\b.*\s(--login|-l)\b' &>/dev/null
  then
    echo "starting gnome-keyring-daemon..."
    gnome-keyring-daemon -s   > "$HOME/.ssh/ssh-agent"
  else
    echo "starting ssh-agent..."
    ssh-agent | grep -v ^echo > "$HOME/.ssh/ssh-agent"
  fi

  chmod 0600 "$HOME/.ssh/ssh-agent"
  cat        "$HOME/.ssh/ssh-agent"
  # shellcheck source=/dev/null
  source     "$HOME/.ssh/ssh-agent"

}

function check_ssh_agent {

  if [[ ! -d "$HOME/.ssh" ]]; then
    if ! install -m 755 -d "$HOME/.ssh"; then
      echo "ERROR: cannot create .ssh dir" >&2
      return 1
    fi
  fi

  if [[ ! -r "$HOME/.ssh/ssh-agent" ]]; then
    if ! touch "$HOME/.ssh/ssh-agent"; then
      echo "ERROR: cannot create ssh-agent env file" >&2
      return 1
    fi
  fi

  # shellcheck source=/dev/null
  source "$HOME/.ssh/ssh-agent"

  if [[ ! -S "$SSH_AUTH_SOCK" ]]; then
    echo "INFO: no socket found (SSH_AUTH_SOCK=$SSH_AUTH_SOCK)"
    load_ssh_agent
  fi

  if [[ -S "$SSH_AUTH_SOCK" ]] && ! export -p | grep -qF ' SSH_AUTH_SOCK='; then
    export SSH_AUTH_SOCK
  fi

}

# On hosts where you want the agent to start:
#   echo "$HOSTNAME" >> "$HOME/.ssh/ssh-agent-hosts"

if grep "^${HOSTNAME}\$" "$HOME/.ssh/ssh-agent-hosts" &>/dev/null; then
  check_ssh_agent
fi

unset load_ssh_agent
unset check_ssh_agent

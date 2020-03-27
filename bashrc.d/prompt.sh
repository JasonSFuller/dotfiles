# Is this an interactive shell?
function generate_prompt {

  if ! tty -s; then return; fi # if no tty, abort

  PS1='[\u@\h \W]\$ '          # default, if nothing else

  # if you have a terminal that supports title updates and color
  if [[ "$TERM" =~ ^(xterm|rxvt) ]]; then

    # rhel/centos adds titles by default (in /etc/bashrc or /etc/profile.d
    # maybe?), but ubuntu does this in $HOME/.bashrc (which I've overwritten).
    if grep -qi ubuntu /etc/*release &>/dev/null; then
      local title="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h:\w\a\]"
    fi

    local red="$(tput bold; tput setaf 1)"
    local grn="$(tput bold; tput setaf 2)"
    local yel="$(tput bold; tput setaf 3)"
    local blu="$(tput bold; tput setaf 4)"
    local rst="$(tput sgr0)"

    PS1="$title[$grn\u@\h$rst $blu\W$rst]\$ " # add title and color

  fi

}

generate_prompt

unset -f generate_prompt


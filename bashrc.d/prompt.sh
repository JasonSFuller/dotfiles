#!/bin/bash

# TODO look at /usr/lib/git-core/git-sh-prompt for inspiration on git prompt

# Is this an interactive shell?
function generate_prompt {

  if ! tty -s; then return; fi # if no tty, abort

  PS1='[\u@\h \W]\$ '          # default, if nothing else

  # if you have a terminal that supports title updates and color
  if [[ "$TERM" =~ ^(xterm|rxvt) ]]; then

    # rhel/centos adds titles by default (in /etc/bashrc or /etc/profile.d
    # maybe?), but ubuntu does this in $HOME/.bashrc (which I've overwritten).
    #
    # also the \[ and \] mean roughly "don't calculate these non-printable
    # characters" for screen drawing things like bash's shopt checkwinsize.
    # if you remove them, your terminal will draw things weirdly.  ask me 
    # how i know.  =/

    if grep -qi ubuntu /etc/*release &>/dev/null; then
      local title="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h:\w\a\]"
    fi
    local grn blu rst
    #red="\[$(tput bold; tput setaf 1)\]"
    grn="\[$(tput bold; tput setaf 2)\]"
    #yel="\[$(tput bold; tput setaf 3)\]"
    blu="\[$(tput bold; tput setaf 4)\]"
    rst="\[$(tput sgr0)\]"

    PS1="${title}[${grn}\u@\h${rst} ${blu}\W${rst}]\$ " # add title and color

  fi

}

generate_prompt

unset -f generate_prompt


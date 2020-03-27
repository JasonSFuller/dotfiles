# Is this an interactive shell?
if tty -s; then
  PS1='[\u@\h \W]\$ '
fi

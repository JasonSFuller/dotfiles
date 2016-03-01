# Source global definitions
if [[ -f /etc/bashrc ]]; then
  . /etc/bashrc
fi

# Source my own scripts
if [[ -d ~/bashrc.d/ ]]; then
  for i in ~/bashrc.d/*.bash; do
    . "$i"
  done
fi
unset -v i

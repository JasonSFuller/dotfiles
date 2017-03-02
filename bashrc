# Source global definitions
if [[ -f /etc/bashrc ]]; then
  . /etc/bashrc
fi

# Source my own scripts
if [[ -d ~/.bashrc.d/ ]]; then
  for i in ~/.bashrc.d/*.sh; do
    . "$i"
  done
  unset -v i
fi

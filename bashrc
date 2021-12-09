# Source global definitions
if [[ -f /etc/bashrc ]]; then
  . /etc/bashrc
fi

# Source my own scripts
# NOTE: gnu coreutils `test -e glob` behaves differently than bash's
#   `if [[ -e glob ]]` and will correctly return if missing dir OR files
#   probably because of shell expansion and THEN `test` doing it's thing
if test -e ~/.bashrc.d/*.sh; then
  for i in ~/.bashrc.d/*.sh; do
    source "$i"
  done
  unset -v i
fi

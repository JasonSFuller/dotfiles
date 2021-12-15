# Source global definitions
if [[ -f /etc/bashrc ]]; then
  . /etc/bashrc
fi

# Source my own scripts
# NOTE: `if [[ -e path ]]` doesn't work as you'd expect for missing dirs or
#   when the dir is empty and glob matching fails.  plus complications like
#   setting nullglob are a PITA to work around--`stat` will fail (desired),
#   while `ls` will succeed (naw dawg)--and so here we are.
if stat ~/.bashrc.d/*.sh &>/dev/null; then
  for i in ~/.bashrc.d/*.sh; do source "$i"; done
  unset -v i
fi

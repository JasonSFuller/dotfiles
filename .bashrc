# Source global definitions
if [[ -f /etc/bashrc ]]; then
  . /etc/bashrc
fi

# Source my own scripts
for i in ~/bashrc.d/*.bash; do 
  . "$i"
done
unset -v i

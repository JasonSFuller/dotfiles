# Source global definitions
if [[ -f /etc/bashrc ]]; then
  . /etc/bashrc
fi

# Source my own scripts
while read -r i
do
    source "$i"
done < <(find "$HOME/.bashrc.d/" -name '*.sh')
unset -v i

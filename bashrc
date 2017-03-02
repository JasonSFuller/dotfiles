# Source global definitions
if [[ -f /etc/bashrc ]]; then
  . /etc/bashrc
fi

# Source my own scripts
if [[ -d ~/.bashrc.d/ ]]; then
  for i in ~/.bashrc.d/*.sh; do
    . "$i"
  done
fi
unset -v i


#alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -la --color=auto'
alias ls='ls --color=auto'



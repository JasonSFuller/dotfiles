if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

PATH=$PATH:$HOME/bin
HISTTIMEFORMAT='%F %T  '

export PATH
export HISTTIMEFORMAT

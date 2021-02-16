alias reload="source ~/.bash_profile"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias python=python3
alias pip=pip3

LANG=en_US.utf8

if $(test -d ~/.bash_it) && $(test -f ~/.bash-it.profile); then
  source ~/.bash-it.profile
else
  BOLD="\[\033[1m\]"; NOBOLD="\[\033[m\]"
  export PS1="${BOLD}\u${NOBOLD}@${BOLD}\h${NOBOLD}:\W\$ "
  unset BOLD; unset NOBOLD
fi

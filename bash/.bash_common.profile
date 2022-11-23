alias reload="source ~/.bash_profile"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias python=python3
alias pip=pip3

cheat() {
  curl https://cht.sh/$1
}

LANG=en_US.utf8

# If we're in a toolbox container, handle that. 
# Otherwise, if we have bash-it, handle that. 
# Otherwise, set a default
if $(test -f /run/.containerenv); then
  # TODO: do something different here. Maybe put the name of the toolbox container we're in into the prompt?
  BOLD="\[\033[1m\]"; NOBOLD="\[\033[m\]"
  export PS1="${BOLD}\u${NOBOLD}@${BOLD}\h${NOBOLD}:\W\$ "
  unset BOLD; unset NOBOLD
elif $(test -d ~/.bash_it) && $(test -f ~/.bash-it.profile); then
  . ~/.bash-it.profile
else
  BOLD="\[\033[1m\]"; NOBOLD="\[\033[m\]"
  export PS1="${BOLD}\u${NOBOLD}@${BOLD}\h${NOBOLD}:\W\$ "
  unset BOLD; unset NOBOLD
fi

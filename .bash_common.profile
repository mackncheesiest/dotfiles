alias reload="source ~/.bash_profile"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias python=python3
alias pip=pip3

if $(test -d ~/.bash_it) && $(test -f ~/.bash-it.profile); then
  source ~/.bash-it.profile
fi
if $(test -d ~/.dircolors) && $(test -f ~/.dircolors/nord.colors); then
  eval "$(dircolors ~/.dircolors/nord.colors)"
fi

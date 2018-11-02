# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# Lines configured by josh
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

HOSTNAME=$HOST
case $HOSTNAME in
  (engr-rcl13g)
    # The following lines were added by compinstall
    zstyle :compinstall filename '/home/jmack2545/.zshrc'
    autoload -Uz compinit
    compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
    # End of lines added by compinstall

    ZSH=~/.oh-my-zsh
    ;;
  (JoshArchBox)
    # The following lines were added by compinstall
    zstyle :compinstall filename '/home/josh/.zshrc'
    autoload -Uz compinit
    compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
    # End of lines added by compinstall
    
    export MAVEN_OPTS='-Xmx8192m -XX:MaxPermSize=512m'
    ZSH=/usr/share/oh-my-zsh
    ;;
esac

bindkey '^r' history-incremental-search-backward

LESSHISTFILE=/dev/null

# Oh-My-Zsh Configuration
ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
plugins=(
    git
)
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
    mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
# End of Oh-My-Zsh Configuration
# End of lines configured by josh

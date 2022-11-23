# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# Lines configured by josh
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

if [ -d "$HOME/anaconda3" ]; then
    . $HOME/anaconda3/etc/profile.d/conda.sh
    conda activate
fi
    
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

if [ -d "$HOME/.oh-my-zsh" ]; then
    ZSH=~/.oh-my-zsh
elif [ -d "/usr/share/oh-my-zsh" ]; then
    ZSH=/usr/share/oh-my-zsh
fi

HOSTNAME=$HOST
case $HOSTNAME in
  (engr-rcl13g)
    ;;
  (Josh-Desktop)
    ;;
  (JoshArchBox)
    export PATH=/opt/cuda/bin:$PATH
    export MAVEN_OPTS='-Xmx8192m -XX:MaxPermSize=512m'
    ;;
esac

bindkey '^r' history-incremental-search-backward

LESSHISTFILE=/dev/null

if [ "$ZSH" ]; then
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
fi
# End of lines configured by josh

if [[ -f $HOME/.lwd ]]; then
    cd `cat $HOME/.lwd`
fi

HISTSIZE=100000

# Set the host alias variable so we can use it in places
if [[ -f $HOME/.hostname ]]; then
    HOST_ALIAS=`cat $HOME/.hostname`
else
    HOST_ALIAS=`hostname`
fi;

ZSH_CUSTOM=$HOME/.zsh_customization
export EDITOR=vim
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="russp"
plugins=(git osx vagrant vi-mode svn)
source $ZSH/oh-my-zsh.sh

function hist() {
    history | grep -v "history |" | grep -v "hist " | grep $* | tail | grep $*
}

function cd() {
  builtin cd $*
  echo `pwd` > ~/.lwd
}

function gth() {
    open `git remote -v | grep origin | head -n1 | awk '{print $2}' | sed 's/:/\//' | sed 's/git@/http:\/\//g' | sed 's/\.git//g'`
}

if [[ -f $HOME/Checkouts/local-scripts/init.sh ]]; then
    export LOCAL_SCRIPTS=$HOME/Checkouts/local-scripts
    source $HOME/Checkouts/local-scripts/init.sh
fi;

. ~/bk/bk.zsh

PATH="$HOME/.bin:$PATH"
PATH=~/bin:$PATH
export PATH

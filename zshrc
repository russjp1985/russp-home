# Path to your oh-my-zsh configuration.
if [[ -f $HOME/.lwd ]]; then
    cd `cat $HOME/.lwd`
fi

HISTSIZE=100000



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


. ~/util/export_all.sh

if [[ -f $HOME/Checkouts/local-scripts/init.sh ]]; then
    export LOCAL_SCRIPTS=$HOME/Checkouts/local-scripts
    source $HOME/Checkouts/local-scripts/init.sh
fi;



if [[ -d $HOME/GoogleAppEngine ]]; then
    # The next line updates PATH for the Google Cloud SDK.
    source '/Users/russp/GoogleAppEngine/google-cloud-sdk/path.zsh.inc'

    # The next line enables bash completion for gcloud.
    source '/Users/russp/GoogleAppEngine/google-cloud-sdk/completion.zsh.inc'
fi;

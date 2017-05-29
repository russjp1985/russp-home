ZSH_ENG_LOCK=$HOME/.use-prezto

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

# If the lock is on, use oh-my-zsh
# Otherwise, use prezto
if [[ -f $ZSH_ENG_LOCK ]]; then
    if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
        source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    fi
    autoload -Uz promptinit
    promptinit
    prompt russp
else
    ZSH_CUSTOM=$HOME/.zsh_customization
    export EDITOR=vim
    export ZSH=$HOME/.oh-my-zsh
    export ZSH_THEME="russp"
    plugins=(git osx vagrant vi-mode svn)
    source $ZSH/oh-my-zsh.sh
fi;

# Toggle the lock file to switch between
# prezto and oh-my-zsh
function toggle-zsh() {
    if [[ -f $ZSH_ENG_LOCK ]]; then
        rm $ZSH_ENG_LOCK;
    else
        touch $ZSH_ENG_LOCK;
    fi;
    zsh
}


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

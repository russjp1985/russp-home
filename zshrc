# Path to your oh-my-zsh configuration.
if [[ -f $HOME/.lwd ]]; then
    cd `cat $HOME/.lwd`
fi

if [[ -f $HOME/.hostname ]]; then
    HOST_ALIAS=`cat $HOME/.hostname`
else
    HOST_ALIAS=`hostname`
fi;

if [[ $TERM != 'dumb' ]]; then
    export ZSH=$HOME/.oh-my-zsh

    # Set to the name theme to load.
    # Look in ~/.oh-my-zsh/themes/
    export ZSH_THEME="russp"

    # Set to this to use case-sensitive completion
    # export CASE_SENSITIVE="true"

    # Comment this out to disable weekly auto-update checks
    # export DISABLE_AUTO_UPDATE="true"

    # Uncomment following line if you want to disable colors in ls
    # export DISABLE_LS_COLORS="true"

    # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
    # Example format: plugins=(rails git textmate ruby lighthouse)
    plugins=(git osx vagrant vi-mode svn brew )

    source $ZSH/oh-my-zsh.sh

    # defaults -currentHost write -globalDomain AppleFontSmoothing -int 3

    # Customize to your needs...
    #export PATH="/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:/opt/local/bin:/usr/local/bin:$PATH"
    #export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Users/russp/util/bin:/Users/russp/local/node/bin:/Users/russp/narwhal/bin:/opt/local/bin"
    RPROMPT="[%{$fg[green]%}${HOST_ALIAS}%{$reset_color%}]"
    PATH="$HOME/node/bin:$PATH"
    NODE_PATH="$NODE_PATH:/usr/local/lib/node_modules"
    PATH="$HOME/.bin:$PATH"
    PATH="$PATH:$HOME/util/bin/remindme"
    #PROMPT="%{$fg_bold[cyan]%}%c %{$reset_color%} $ "
    alias md5sum='md5 -r'
fi;

if [[ $MODE == 'mini' ]]; then
    PROMPT=""
    PROMPT="=============================$ "
    clear
fi;

export EDITOR=vim
. ~/util/export_all.sh

if [[ -f $HOME/Checkouts/local-scripts/init.sh ]]; then
    export LOCAL_SCRIPTS=$HOME/Checkouts/local-scripts
    source $HOME/Checkouts/local-scripts/init.sh
fi;

PATH="$HOME/dev/DevTools:$PATH"

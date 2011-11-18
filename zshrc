# Path to your oh-my-zsh configuration.
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
    chpwd () { print -Pn "\e]0;%m: %~\a" }

    source $ZSH/oh-my-zsh.sh

    defaults -currentHost write -globalDomain AppleFontSmoothing -int 3

    # Customize to your needs...
    export PATH="/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:/opt/local/bin:/usr/local/bin:$PATH"
    export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Users/russp/util/bin:/Users/russp/local/node/bin:/Users/russp/narwhal/bin:/opt/local/bin"
    RPROMPT="[%{$fg[cyan]%}%M%{$reset_color%}]"
    NODE_PATH="$NODE_PATH:/usr/local/lib/node_modules"
    #PROMPT="%{$fg_bold[cyan]%}%c %{$reset_color%} $ "
    source /Users/russp/.rvm/src/rvm/scripts/rvm
    alias md5sum='md5 -r'
fi;
export EDITOR=vim
. ~/util/export_all.sh

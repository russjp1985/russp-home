. ~/util/alias.sh
. ~/util/update.sh

# Custom zsh functions
. ~/util/functions/gth.zsh

# Utilities
. ~/util/bk/bk.zsh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/.composer/vendor/bin
PATH="$HOME/.bin:$PATH"
PATH="$PATH:$HOME/util/bin/remindme"
PATH=~/util/bin:$PATH
export PATH

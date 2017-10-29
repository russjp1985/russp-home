# Store the path of the current directory in a hidden file (.lwd)
# Every time we kick off a new shell, go to that folder.
function cd() {
  builtin cd $*
  echo `pwd` > ~/.lwd
}

if [[ -f $HOME/.lwd ]]; then
    cd "`cat $HOME/.lwd`"
fi




# Set the size of the history to be really long, and add 
# the helper function `hist` to easily grep it.
HISTSIZE=100000

function hist() {
    history | grep -v "history |" | grep -v "hist " | grep $* | tail | grep $*
}





# Set the host alias variable so we can use it in places.
# Specifically use this in the zsh theme. This lets us override
# the hostname that's being displayed to something maybe more
# meaningful (ie - My iMac, Workstation, etc).
if [[ -f $HOME/.hostname ]]; then
    HOST_ALIAS=`cat $HOME/.hostname`
else
    HOST_ALIAS=`hostname`
fi;





# Load oh-my-zsh. 
# It's kinda heavy handed for what I actually use from it,
# but oh well.
ZSH_CUSTOM=$HOME/.zsh_customization
export EDITOR=vim
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="russp"
plugins=(git osx vi-mode svn)
source $ZSH/oh-my-zsh.sh





# Function to open the current git repository in a browser on github.
function gth() {
    open `git remote -v | grep origin | head -n1 | awk '{print $2}' | sed 's/:/\//' | sed 's/git@/http:\/\//g' | sed 's/\.git//g'`
}




# Load ~/Checkouts/local-scripts/init.sh
# This is a pattern so that every box can have it's own version
# controlled set of tools that don't end up in public github
if [[ -f $HOME/Checkouts/local-scripts/init.sh ]]; then
    export LOCAL_SCRIPTS=$HOME/Checkouts/local-scripts
    source $HOME/Checkouts/local-scripts/init.sh
fi;




# Load bk
# https://github.com/russpos/bka
if [[ -f ~/Checkouts/bk ]]; then
    . ~/Checkouts/bk/bk.zsh
else
    echo "Can't find your bookmark helper! Try cloning it to: ~/Checkouts"
fi;


# Add ~/.bin ~/bin and ~/Checkouts/russp-home/bin to your path
PATH="$HOME/.bin:$PATH"
PATH="$HOME/Checkouts/russp-home/bin:$PATH"
PATH=~/bin:$PATH
export PATH

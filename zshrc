# Store the path of the current directory in a hidden file (.lwd)
# Every time we kick off a new shell, go to that folder.
function cd() {
  builtin cd $*
  echo `pwd` >> ~/.lwd
  echo "$(tail -n100 $HOME/.lwd)" > $HOME/.lwd
}

if [[ -f $HOME/.lwd ]]; then
    # use the builtin cd to go to the last line in the lwd history
    # Don't use cd() so we don't put the same directory back on the stack
    builtin cd "`tail -n1 $HOME/.lwd`"
fi

# cd "last"
# Go the last place in your history iwth no modification to your history.
# Helpful for multiple panes / tabs, so you can cd into the directory
# you just cd()'ed into in another tab without pushing more of the same
# directory onto your stack.
function cdl() {
  builtin cd "$(cat ~/.lwd | tail -n 1)"
}

# cd "backwards"
# Go to the previous place you were in history. Pops the last item off 
# of the stack and goes to the one before that.
function cdb() {
    # Rewrite the history file removing the last line
    echo "$(cat $HOME/.lwd | sed \$d)" > $HOME/.lwd
    cdl
}



# Set the size of the history to be really long, and add
# the helper function `hist` to easily grep it.
HISTSIZE=100000

function hist() {
    history | grep -v "history |" | grep -v "hist " | grep $*
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


function setmoji() {
    echo $* > ~/.hostmoji
}

alias hideDesktop='defaults write com.apple.finder CreateDesktop false; killall Finder'
alias showDesktop='defaults write com.apple.finder CreateDesktop true; killall Finder'


# Load bk
# https://github.com/russpos/bka
if [[ -d ~/Checkouts/bk ]]; then
    . ~/Checkouts/bk/bk.zsh
else
    echo "Can't find your bookmark helper! Try cloning it to: ~/Checkouts"
fi;


# Add ~/.bin ~/bin and ~/Checkouts/russp-home/bin to your path
PATH="$HOME/.bin:$PATH"
PATH="$HOME/Checkouts/russp-home/bin:$PATH"
PATH=~/bin:$PATH
export PATH

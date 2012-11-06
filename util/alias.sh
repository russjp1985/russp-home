alias la="la -A"
alias ll="ls -l"
alias st="svn status  | grep \"[MACDX?]\" | sort"
alias yui="java -jar ~/util/tools/yui-compressor.jar"
alias here="pwd | pbcopy"
alias there="cd \`pbpaste\`"
alias nodeytool="~/Checkouts/nodey-tools/bin"
alias lc="clear; ls --width=1"
alias ec="edit-class"
alias sha1sum="shasum"
alias now="php -r 'echo time();'"

function trash() {
    mv $* ~/.Trash
}

function mini() {
  zsh
  RPROMPT=''
  PROMPT='$ '
  clear
}

alias lwd=echo `pwd` > ~/.lwd

function cim() {
  touch $1;
  vim $1
}

function hist() {
    history | grep -v "history |" | grep -v "hist " | grep $* | tail | grep $*
}


function gitview() {
  URL_BASE=git remote -v | grep origin | grep fetch | awk '{print $2}' | sed s/git\:/https:/ | sed s/\.git$//
}

function cd() {
  builtin cd $*
  echo `pwd` > ~/.lwd
}

alias la="la -A"
alias ll="ls -l"
alias st="svn status  | grep \"[MACDX?]\" | sort"
# alias vim="open -a /Applications/MacVim.app"
alias yui="java -jar ~/util/tools/yui-compressor.jar"
alias here="pwd | pbcopy"
alias there="cd \`pbpaste\`"
alias nodeytool="~/Checkouts/nodey-tools/bin"
alias git="env GIT_SSL_NO_VERIFY=true git"
alias lwd=echo `pwd` > ~/.lwd

function cim() {
  touch $1;
  vim $1
}

function cd() {
  builtin cd $*
  echo `pwd` > ~/.lwd
}

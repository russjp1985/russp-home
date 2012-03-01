alias la="la -A"
alias ll="ls -l"
alias st="svn status  | grep \"[MACDX?]\" | sort"
# alias vim="open -a /Applications/MacVim.app"
alias yui="java -jar ~/util/tools/yui-compressor.jar"
alias here="pwd | pbcopy"
alias there="cd \`pbpaste\`"
alias nodeytool="~/Checkouts/nodey-tools/bin"

function cim() {
  touch $1;
  vim $1
}

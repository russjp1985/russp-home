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
alias md5sum='md5 -r'
alias t=touch

# Join my standard editor session
alias rocknroll="tmux -u attach-session -t editor"

growl() { echo -e $'\e]9;'$REPLY'\007' ; return ; }

function trash() {
    mv $* ~/.Trash
}

function mini() {
  zsh
  RPROMPT=''
  PROMPT='$ '
  clear
}

function code_i_wrote() {
    git log --author `whoami` --since `php -r "echo date('Y-m-d', strtotime('$1'));"` --oneline | awk '{print $1}' | xargs git show | grep '^\+[^\+]' | wc -l
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

function growl() {
    xargs -Ix echo $(export x=x; echo -e \$'\e]9;'${x}'\007');
}

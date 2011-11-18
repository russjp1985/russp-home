alias ll="ls -l"
alias la="la -A"

alias yui="java -jar ~/util/tools/yui-compressor.jar"

compctl -K __vs vs

function gvim() {
    touch $1
    open $1 -a /Applications/MacVim.app
}

if [ -d /Users/russp ];then
    function vim() {
        touch $1
        open $1 -a /Applications/MacVim.app
    }
fi

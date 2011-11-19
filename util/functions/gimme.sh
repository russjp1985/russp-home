# Gimme auto-complete
function __gimme {
    eval "reply=(`gimme list`)"
}
compctl -K __gimme gimme

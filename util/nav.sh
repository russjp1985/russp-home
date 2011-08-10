PKGDIR=~/svn/packages

# Package navigation
#
# Uses $PKGDIR variable to dynamically naviated package checkouts
pkg () {
    if [ -n "$1" ]; then
        if [ -d "$PKGDIR/$1/trunk" ]; then
            echo "Found package $PKGDIR/$1"
            echo
            builtin cd "$PKGDIR/$1/trunk"
            ls -l
            return
        fi
        for pkg in `find -L "$PKGDIR" -maxdepth 1 -type d -name "*$1*" -print`; do
            echo "Found package $pkg"
            echo
            builtin cd "$pkg/trunk"
            ls -l
            return
        done
        echo "Package not found: $1"
    else
        builtin cd $PKGDIR
        ls -l
    fi
}
__pkg(){
    opts=`ls $PKGDIR | sed s/python-//g | sed s/php5-//g | sed s/lib//g | sed s/js-//g`
    eval "reply=($opts)"
}
compctl -K __pkg pkg

# Completion for BK - file system bookmarker
function bk_avail {
    opts=`ls /Users/russp/.bk/`
    eval "reply=($opts)"
}
compctl -K bk_avail bk

# Vagrant auto-complete
function __vagrant {
    VM=''
    CMD="init"
    if [ -f "Vagrantfile" ]; then
        VM=`cat Vagrantfile | awk /vm.define/'{print \$2}' | paste -s -d : - | sed s/:/\ /g | sed s/\ \ /\ /g`
        CMD="up down halt ssh destroy reload provision"
    fi
    eval "reply=($VM $CMD)"
}
#compctl -K __vagrant vagrant

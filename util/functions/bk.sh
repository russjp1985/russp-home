function bk() {
    if (( ! $# )); then
        echo "Bookmark Manager v2.0"
        echo "---------------------"
        echo ""
        echo "bk <bookmark>    - Go to bookmark"
        echo "bk -c <bookmark> - Create new bookmark of CWD"
        echo "bk -d <bookmark> - Delete bookmark"
        return 1
    fi

    # Create a bookmark
    if [[ $1 == -c ]]; then
        touch ~/.bk/$2
        echo `pwd` >> ~/.bk/$2
        echo "Created bookmark '$2' at `pwd`"
        return 1
    fi

    # List all bookmarks
    if [[ $1 == -l ]]; then
        for i in `ls ~/.bk`
        do
            echo " [$i]\t`cat ~/.bk/$i`"
        done
        return 1
    fi

    # Delete bookmark
    if [[ $1 == -d ]]; then
        if [[ -a ~/.bk/$2 ]]; then
            rm ~/.bk/$2
            echo "Removed bookmark '$2'"
            return 1
        fi
        echo "No bookmark found named '$2'"
        return 0
    fi

    # Goto bookmark
    if [[ -a ~/.bk/$1 ]]; then
        cd `cat ~/.bk/$1`
    else
        echo "No bookmark found named '$1'"
    fi
}

lint() {
    svn status | grep .py | grep -v svn | python ~/util/bin/lint.py
}


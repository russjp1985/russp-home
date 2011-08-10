. ~/util/nav.sh
. ~/util/svn.sh
. ~/util/alias.sh
. ~/util/testing.sh
. ~/util/functions/*.sh

PATH=$PATH:~/util/bin
export PATH

if [ -d ~/greenarc_util ]; then
    . ~/greenarc_util/export.sh
fi

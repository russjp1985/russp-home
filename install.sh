cd ~
mkdir -f Checkouts
cd Checkouts
git clone git@github.com:russjp1985/russp-home.git
cd russp-home

ln -s `pwd`/vim ~/.vim
ln -s `pwd`/vimrc ~/.vimrc
ln -s `pwd`/zshrc ~/.zshrc
ln -s `pwd`/gvimrc ~/.gvimrc
ln -s `pwd`/util ~/util

git submodule update  --init
zsh

# Create folders, checkout code, and enter that directory
CHECKOUT_PATH=$HOME/Checkouts
CODE_PATH=$CHECKOUT_PATH/russp-home

mkdir -p $CHECKOUT_PATH
cd $CHECKOUT_PATH
git clone git@github.com:russjp1985/russp-home.git
cd $CODE_PATH

# Erase existing and create new dotfiles and dotfolders
rm $HOME/.vimrc
ln -s $CHECKOUT_PATH/vimrc ~/.vimrc

rm $HOME/.zshrc
ln -s $CHECKOUT_PATH/zshrc $HOME/.zshrc

rm $HOME/.gvimrc
ln -s $CHECKOUT_PATH/gvimrc $HOME/.gvimrc

rm -rf $HOME/.vim
ln -s $CHECKOUT_PATH/vim $HOME/.vim

rm -rf $HOME/.tmux.conf
ln -s $CHECKOUT_PATH/tmux.confg $HOME/.tmux.conf

rm -rf $HOME/util
ln -s $CHECKOUT_PATH/util $HOME/util

# Dot files are all in place, initialize all the subrepos
git submodule update --init

# Restart shell
zsh

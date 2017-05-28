# Create folders, checkout code, and enter that directory
CHECKOUT_PATH=$HOME/Checkouts
CODE_PATH=$CHECKOUT_PATH/russp-home

cd $CODE_PATH

ln -s $CODE_PATH/zsh_customization ~/.zsh_customization

# Erase existing and create new dotfiles and dotfolders
rm $HOME/.vimrc
ln -s $CODE_PATH/vimrc ~/.vimrc

rm $HOME/.zshrc
ln -s $CODE_PATH/zshrc $HOME/.zshrc

rm $HOME/.gvimrc
ln -s $CODE_PATH/gvimrc $HOME/.gvimrc

rm -rf $HOME/.vim
ln -s $CODE_PATH/vim $HOME/.vim

rm -rf $HOME/.tmux.conf
ln -s $CODE_PATH/tmux.confg $HOME/.tmux.conf

rm -rf $HOME/util
ln -s $CODE_PATH/util $HOME/util

# Dot files are all in place, initialize all the subrepos
git submodule update --init

# Restart shell
zsh

# Create folders, checkout code, and enter that directory
CHECKOUT_PATH=$HOME/Checkouts
CODE_PATH=$CHECKOUT_PATH/russp-home

mkdir -p $CHECKOUT_PATH

git clone git@github.com:russpos/russp-home.git $CODE_PATH
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
git clone git@github.com:sorin-ionescu/prezto.git $HOME/.zprezto

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

rm -rf $HOME/.zpreztorc
ln -s $CODE_PATH/zpreztorc $HOME/.zpreztorc

rm -rf $HOME/.zprezto/modules/prompt/external/russp
ln -s $CODE_PATH/prezto-theme $HOME/.zprezto/modules/prompt/external/russp

# Dot files are all in place, initialize all the subrepos
git submodule update --init

# Restart shell
zsh

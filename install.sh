# Create folders, checkout code, and enter that directory
CHECKOUT_PATH=$HOME/Checkouts
CODE_PATH=$CHECKOUT_PATH/russp-home

mkdir -p $CHECKOUT_PATH

git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

cd $CODE_PATH

ln -s $CODE_PATH/zsh_customization ~/.zsh_customization

# Erase existing and create new dotfiles and dotfolders
touch $HOME/.vimrc
mv $HOME/.vimrc ~/HOME/.vimrc.back
ln -s $CODE_PATH/vimrc ~/.vimrc

touch $HOME/.zshrc
mv $HOME/.zshrc ~/HOME/.zshrc.back
ln -s $CODE_PATH/zshrc $HOME/.zshrc

mv -rf $HOME/.vim.back
ln -s $CODE_PATH/vim $HOME/.vim

touch $HOME/.tmux.conf
mv $HOME/.tmux.conf $HOME/.tmux.conf.back
ln -s $CODE_PATH/tmux.confg $HOME/.tmux.conf

# Restart shell
zsh

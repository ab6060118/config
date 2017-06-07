#!/bin/bash

./installZsh.sh

ln -s $PWD/.vimrc $HOME
ln -s $PWD/.tmux.conf $HOME
ln -s $PWD/.inputrc $HOME
ln -s $PWD/.vim $HOME
ln -s $PWD/.gitconfig $HOME
ln -sf $PWD/.zshrc $HOME
ln -s $PWD/daubakao.zsh-theme $HOME/.oh-my-zsh/themes

vim -c PluginInstall -c qa

echo '##########################'
echo '#  Starting install YCM  #'
echo '##########################'

./installYCM.sh

chsh $USERNAME -s /usr/bin/zsh

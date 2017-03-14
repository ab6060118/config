#!/bin/bash

./installZsh.sh

cp ./.vimrc ~
cp ./.tmux.conf ~
cp ./.inputrc ~
cp -r ./.vim ~
cp ./.gitconfig ~
cp ./.zshrc ~
cp ./daubakao.zsh-theme ~/.oh-my-zsh/theme

chsh $USERNAME -s /usr/bin/zsh

vim -c PluginInstall -c qa

echo '##########################'
echo '#  Starting install YCM  #'
echo '##########################'

./installYCM.sh

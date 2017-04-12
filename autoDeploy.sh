#!/bin/bash

./installZsh.sh

cp ./.vimrc ~
cp ./.tmux.conf ~
cp ./.inputrc ~
cp -r ./.vim ~
cp ./.gitconfig ~
cp ./.zshrc ~
cp ./daubakao.zsh-themes ~/.oh-my-zsh/theme

vim -c PluginInstall -c qa

echo '##########################'
echo '#  Starting install YCM  #'
echo '##########################'

./installYCM.sh

chsh $USERNAME -s /usr/bin/zsh

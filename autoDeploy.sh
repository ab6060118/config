#!/bin/bash

cp ./.vimrc ~
cp ./.tmux.conf ~
cp ./.bashrc ~
cp ./.inputrc ~
cp -r ./.vim ~
cp ./.gitconfig ~
cp ./.git-prompt.sh ~

source ~/.bashrc

vim -c PluginInstall -c qa

echo '##########################'
echo '#  Starting install YCM  #'
echo '##########################'

./installYCM.sh

echo '#############################'
echo '#  Starting install nodejs  #'
echo '#############################'

./installJSCompleter.sh


echo '############################'
echo '#  Starting install ctags  #'
echo '############################'

sudo apt-get install exuberant-ctags -y

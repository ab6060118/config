#!/bin/bash

sudo apt-get install update
sudo apt-get install curl

ln -s $PWD/.tmux.conf $HOME
ln -s $PWD/.inputrc $HOME
ln -s $PWD/.gitconfig $HOME

./installZsh.sh
./installNvim.sh
./installNVM.sh

chsh $USERNAME -s /usr/bin/zsh

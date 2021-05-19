#!/bin/sh

sudo apt-get install zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

ln -sf $PWD/.zshrc $HOME
ln -s $PWD/daubakao.zsh-theme $HOME/.oh-my-zsh/themes

#!/bin/bash

NVIM_PATH=$HOME/.config/nvim

ln -s $PWD/.tmux.conf $HOME
ln -s $PWD/.inputrc $HOME
ln -s $PWD/.gitconfig $HOME

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew cask instal iterm2

# install nvim
mkdir $NVIM_PATH
cp $PWD/.vim/colors/wombat256.vim $NVIM_PATH/colors
ln -s $PWD/init.vim $NVIM_PATH
ln -s $PWD/coc-settings.json $NVIM_PATH
brew install neovim

# install oh my zash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -sf $PWD/.zshrc $HOME
ln -s $PWD/daubakao.zsh-theme $HOME/.oh-my-zsh/themes

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# install powerline fonts
git clone git://github.com/powerline/fonts ~/.powerline_fonts
~/.powerline_fonts/install.sh

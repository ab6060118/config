NVIM_PATH=$HOME/.config/nvim

ln -s $PWD/.vim $NVIM_PATH
ln -s $PWD/init.vim $NVIM_PATH

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim 
sudo ln -sf /usr/bin/nvim /usr/bin/vim

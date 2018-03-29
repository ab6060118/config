NODE_INSTALL_PATH=/opt/node
NODE_BIN_PATH=$NODE_INSTALL_PATH/bin

wget https://nodejs.org/dist/v8.0.0/node-v8.0.0-linux-x64.tar.xz

tar -xvf node-v8.0.0-linux-x64.tar.xz

rm node-v8.0.0-linux-x64.tar.xz

sudo mv node-v8.0.0-linux-x64 $NODE_INSTALL_PATH

cd ~/.vim/bundle/tern_for_vim
npm install

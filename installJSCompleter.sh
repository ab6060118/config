NODE_INSTALL_PATH=/opt/node
NODE_BIN_PATH=$NODE_INSTALL_PATH/bin

wget https://nodejs.org/dist/v10.15.0/node-v10.15.0-linux-x64.tar.xz

tar -xvf node-v10.15.0-linux-x64.tar.xz

rm node-v10.15.0-linux-x64.tar.xz

sudo mv node-v10.15.0-linux-x64 $NODE_INSTALL_PATH

wget https://nodejs.org/dist/v7.10.0/node-v7.10.0-linux-x64.tar.xz 
tar -xvf node-v7.10.0-linux-x64.tar.xz
rm node-v7.10.0-linux-x64.tar.xz
sudo mv node-v7.10.0-linux-x64 /opt/node
cd ~/.vim/bundle/tern_for_vim && npm install

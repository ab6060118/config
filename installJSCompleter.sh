wget https://nodejs.org/dist/v8.0.0/node-v8.0.0-linux-x64.tar.xz
tar -xvf node-v8.0.0-linux-x64.tar.xz
rm node-v8.0.0-linux-x64.tar.xz
sudo mv node-v8.0.0-linux-x64 /opt/node
cd ~/.vim/bundle/tern_for_vim && npm install

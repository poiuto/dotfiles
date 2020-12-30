echo "installing node"
sudo apt-get install -y nodejs
sudo npm cache clean -f
sudo npm install -g n stable
sudo npm install -g npm

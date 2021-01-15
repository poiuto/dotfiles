echo "==> installing node"
if [ -f "/etc/arch-release" ]; then
  sudo pacman -S --noconfirm npm
else
  sudo apt-get install -y nodejs
  sudo npm cache clean -f
  sudo npm install -g n stable
  sudo npm install -g npm
fi

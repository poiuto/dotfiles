# xcape, remap Caps to both Ctrl and Esc
echo "==> installing xcape"
if [ -f "/etc/arch-release" ]; then
  sudo pacman -S gcc make pkg-config xcape
else
  sudo apt-get install -y git gcc make pkg-config libx11-dev libxtst-dev libxi-dev
  git clone https://github.com/alols/xcape.git
  cd xcape
  make
  sudo make install
  cd ~
  sudo rm -rf xcape
fi
#xape -e 'Control_L=Escape'

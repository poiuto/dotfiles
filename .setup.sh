# xcape, remap Caps to both Ctrl and Esc
sudo apt-get install git gcc make pkg-config libx11-dev libxtst-dev libxi-dev -y
git clone https://github.com/alols/xcape.git
cd xcape
make
sudo make install
cd ~
sudo rm xcape
#xape -e 'Control_L=Escape'

#!/bin/bash
# This installs alacritty terminal on ubuntu (https://github.com/jwilm/alacritty)
# You have to have rust/cargo installed for this to work

# Install required tools
echo "
installing rustup"
sudo apt-get install -y cmake libfreetype6-dev libfontconfig1-dev xclip
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup override set stable
rustup update stable
sudo apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3

# Download, compile and install Alacritty
echo "
installing alacritty"
git clone https://github.com/jwilm/alacritty
cd alacritty
cargo build --release

sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null

# Add Man-Page entries
sudo mkdir -p /usr/local/share/man/man1
gzip -c alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null

# Remove temporary dir
cd ..
rm -r alacritty

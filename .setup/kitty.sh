echo "==> installing kitty"
sudo curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sudo ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
sudo cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications

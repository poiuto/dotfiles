echo "==> installing firefox"
if [ -f "/etc/arch-release" ]; then
  sudo pacman -S --noconfirm firefox
else
  sudo apt-get install -y firefox
fi
echo "=> copying firefox files"
sh $HOME/.config/firefox/copy-ff-config.sh

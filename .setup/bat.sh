echo "==> installing bat"
if [ -f "/etc/arch-release" ]; then
  sudo pacman -S --noconfirm bat
else
  sudo apt install -yo Dpkg::Options::="--force-overwrite" bat
fi

echo "==> installing ripgrep"
if [ -f "/etc/arch-release" ]; then
  sudo pacman -S --noconfirm ripgrep
else
  sudo apt-get install -y ripgrep
fi

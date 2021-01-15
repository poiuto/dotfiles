echo "==> installing xorg"
if [ -f "/etc/arch-release" ]; then
  sudo pacman -S --noconfirm xorg xorg-server xorg-apps xorg-xinit
else
fi

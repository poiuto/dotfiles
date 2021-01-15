echo "==> installing yay"
if [ -f "/etc/arch-release" ]; then
  sudo pacman -S --noconfirm base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  sudo makepkg -si --noconfirm
  cd ..
  sudo rm -rf yay
else

fi

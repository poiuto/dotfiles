echo "==> installing kde"
if [ -f "/etc/arch-release" ]; then
  sudo pacman -S --noconfirm xorg plasma kde-applications
  systemctl enable sddm.service
  systemctl enable NetworkManager.service
else
fi

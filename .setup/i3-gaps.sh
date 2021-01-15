echo "==> installing i3-gaps"
if [ -f "/etc/arch-release" ]; then
  sudo pacman -R --noconfirm i3-wm
  sudo pacman -S --noconfirm i3-gaps
  sudo chmod g+w .xinitrc
else
fi

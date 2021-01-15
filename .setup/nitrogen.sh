echo "==> installing nitrogen"
if [ -f "/etc/arch-release" ]; then
  sudo pacman -S --noconfirm nitrogen
else

fi

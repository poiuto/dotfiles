echo "==> installing polybar"
if [ -f "/etc/arch-release" ]; then
  sudo yay -S --noconfirm polybar
else
fi

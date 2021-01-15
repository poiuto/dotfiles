echo "==> installing tmux"
if [ -f "/etc/arch-release" ]; then
  sudo pacman -S --noconfirm tmux
else
  sudo apt-get install -y tmux
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

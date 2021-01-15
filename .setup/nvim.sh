echo "==> installing vim & neovim"
if [ -f "/etc/arch-release" ]; then
  sudo pacman -S --noconfirm vim neovim python-pynvim vim-clap
else
  sudo apt-get install -y neovim python-neovim python3-neovim
fi

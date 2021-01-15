echo "==> installing zsh"
if [ -f "/etc/arch-release" ]; then
  sudo pacman -S --noconfirm zsh
else
  sudo apt-get install -y zsh
fi
# oh-my-zsh
sudo git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# Fast Syntax Highlighting
sudo git clone https://github.com/zdharma/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
# ZSH Autosuggestions 
sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# p10k
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# set zsh as default
chsh -s /bin/zsh

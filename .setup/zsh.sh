echo "installing zsh"
sudo apt-get install -y zsh
# oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# Fast Syntax Highlighting
git clone https://github.com/zdharma/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
# ZSH Autosuggestions 
git clone https://github.com/zsh-users/zsh-autosuggestions.git $OH_MY_ZSH/plugins/zsh-autosuggestions
# p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# set zsh as default
chsh -s /bin/zsh

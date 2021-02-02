#!/bin/bash

# connect to wifi
#nmcli device
#nmcli device wifi rescan
#nmcli device wifi list
#nmcli device wifi connect SSID password wireless-password

# exit when any command fails
set -e

if [ -f "/etc/arch-release" ]; then
  echo "=========================== update ==========================="
  sudo pacman -Syyu --noconfirm

  echo "=========================== yay ==========================="
  sudo pacman -S --noconfirm base-devel curl wget
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  sudo rm -rf yay

  echo "=========================== zsh ==========================="
  sudo pacman -S --noconfirm zsh
    # oh-my-zsh
  sudo git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  # Fast Syntax Highlighting
  sudo git clone https://github.com/zdharma/fast-syntax-highlighting.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
  # ZSH Autosuggestions 
  sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  # p10k
  sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  #git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  # set zsh as default
  chsh -s /bin/zsh

  echo "=========================== xorg ==========================="
  sudo pacman -S --noconfirm xorg xorg-server xorg-xinit xf86-video-intel

  echo "=========================== xfce ==========================="
  #sudo pacman -S --noconfirm xorg xorg-apps xorg-server xorg-xinit plasma kde-applications
  #systemctl enable sddm.service
  sudo pacman -S --noconfirm xfce4 xfce4-goodies gvfs 
  yay -S --noconfirm xfce-polkit
  #echo "=========================== lightdm ==========================="
  #sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter
  #sudo systemctl enable lightdm.service

  echo "=========================== bat ==========================="
  sudo pacman -S --noconfirm bat tree

  echo "=========================== colorscripts ==========================="
  sudo rm -rf shell-color-scripts
  git clone https://gitlab.com/dwt1/shell-color-scripts.git
  cd shell-color-scripts
  sudo rm -rf /opt/shell-color-scripts || return 1
  sudo mkdir -p /opt/shell-color-scripts/colorscripts || return 1
  sudo cp -rf colorscripts/* /opt/shell-color-scripts/colorscripts
  sudo cp colorscript.sh /usr/bin/colorscript
  sudo rm -rf ../shell-color-scripts
  sudo rm -rf /opt/shell-color-scripts/colorscripts/pipes*

  for file in /opt/shell-color-scripts/colorscripts/*
  do
    sudo sed -i '/This should/d' $file
  done

  sudo sed -i '/echo "\${random_colorscript}"/d' /usr/bin/colorscript

  echo "=========================== firefox ==========================="
  sudo pacman -S --noconfirm firefox
  echo "=> copying firefox files"
  sh $HOME/.config/firefox/copy-ff-config.sh
  # tridactyl
  curl -fsSl https://raw.githubusercontent.com/tridactyl/tridactyl/master/native/install.sh -o /tmp/trinativeinstall.sh && sh /tmp/trinativeinstall.sh 1.20.4

  echo "=========================== i3-gaps ==========================="
  sudo pacman -S --noconfirm i3-gaps unclutter nitrogen rofi dmenu
  yay -S --noconfirm polybar

  echo "=========================== kitty ==========================="
  sudo pacman -S --noconfirm kitty

  echo "=========================== npm ==========================="
  sudo pacman -S --noconfirm npm nodejs

  echo "=========================== nvim ==========================="
  sudo pacman -S --noconfirm vim neovim python-pynvim vim-clap xclip

  echo "=========================== ripgrep ==========================="
  sudo pacman -S --noconfirm ripgrep

  echo "=========================== tmux ==========================="
  sudo pacman -S --noconfirm tmux
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/bin/install_plugins

  echo "=========================== xcape ==========================="
  sudo pacman -S --noconfirm gcc make pkg-config xcape

  echo "=========================== mircrocode INTEL ==========================="
  sudo pacman -S --noconfirm intel-ucode

  echo "=========================== zip ==========================="
  sudo pacman -S --noconfirm zip unzip rar unrar tar rsync

  echo "=========================== fonts ==========================="
  sudo pacman -S --noconfirm adobe-source-sans-pro-fonts ttf-dejavu ttf-linux-libertine ttf-inconsolata # noto-fonts
  echo "=========================== libreoffice, discord ==========================="
  sudo pacman -S --noconfirm libreoffice discord
  #yay -S --noconfirm enchant mythes-en ttf-liberation hunspell-en_US ttf-bitstream-vera pkgstats adobe-source-sans-pro-fonts gst-plugins-good ttf-droid ttf-dejavu aspell-en icedtea-web gst-libav ttf-ubuntu-font-family ttf-anonymous-pro jre8-openjdk languagetool libmythes

  echo "=========================== vlc ==========================="
  sudo pacman -S --noconfirm vlc

  echo "=========================== sound ==========================="
  sudo pacman -S --noconfirm pulseaudio pulseaudio-alsa

  echo "=========================== redshift ==========================="
  sudo pacman -S --noconfirm redshift-minimal xorg-xbacklight
  chmod +x ~/.config/redshift/hooks/brightness.sh
  sudo echo "[redshift]
  allowed=true
  system=false
  users=" >> /etc/geoclue/geoclue.conf
  sudo systemctl --user enable redshift.service --now

  echo "=========================== LTS kernel ==========================="
  sudo pacman -S --noconfirm linux-lts linux-lts-headers || { exit 1; }

  echo "=========================== removing orphans ==========================="
  sudo pacman -Rns --noconfirm $(pacman -Qtdq)
  sudo grub-mkconfig -o /boot/grub/grub.cfg
else
############################ for ubuntu ############################
  echo "=========================== update ==========================="
  sudo apt-get update
  sudo apt-get upgrade

  echo "=========================== zsh ==========================="
  sudo apt-get install -y zsh
  # oh-my-zsh
  sudo git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  # Fast Syntax Highlighting
  sudo git clone https://github.com/zdharma/fast-syntax-highlighting.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
  # ZSH Autosuggestions 
  sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  # p10k
  #sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  # set zsh as default
  chsh -s /bin/zsh

  echo "=========================== bat ==========================="
  sudo apt install -yo Dpkg::Options::="--force-overwrite" bat

  echo "=========================== colorscripts ==========================="
  sudo rm -rf shell-color-scripts
  git clone https://gitlab.com/dwt1/shell-color-scripts.git
  cd shell-color-scripts
  sudo rm -rf /opt/shell-color-scripts || return 1
  sudo mkdir -p /opt/shell-color-scripts/colorscripts || return 1
  sudo cp -rf colorscripts/* /opt/shell-color-scripts/colorscripts
  sudo cp colorscript.sh /usr/bin/colorscript
  sudo rm -rf ../shell-color-scripts
  sudo rm -rf /opt/shell-color-scripts/colorscripts/pipes*

  for file in /opt/shell-color-scripts/colorscripts/*
  do
    sudo sed -i '/This should/d' $file
  done

  sudo sed -i '/echo "\${random_colorscript}"/d' /usr/bin/colorscript

  echo "=========================== firefox ==========================="
  sudo apt-get install -y firefox
  echo "=> copying firefox files"
  sh $HOME/.config/firefox/copy-ff-config.sh
  # tridactyl
  curl -fsSl https://raw.githubusercontent.com/tridactyl/tridactyl/master/native/install.sh -o /tmp/trinativeinstall.sh && sh /tmp/trinativeinstall.sh 1.20.4

  echo "=========================== kitty ==========================="
  sudo curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  sudo ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
  sudo cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications

  echo "=========================== npm ==========================="
  sudo apt-get install -y nodejs
  sudo npm cache clean -f
  sudo npm install -g n stable
  sudo npm install -g npm

  echo "=========================== nvim ==========================="
  sudo apt-get install -y neovim python-neovim python3-neovim

  echo "=========================== ripgrep ==========================="
  sudo apt-get install -y ripgrep

  echo "=========================== tmux ==========================="
  sudo apt-get install -y tmux

  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/bin/install_plugins

  echo "=========================== xcape ==========================="
  sudo apt-get install -y git gcc make pkg-config libx11-dev libxtst-dev libxi-dev
  git clone https://github.com/alols/xcape.git
  cd xcape
  make
  sudo make install
  cd ~
  sudo rm -rf xcape
fi

#curDir="$(dirname "$(readlink -f "$0")")"
#for file in $curDir/*
#do
  #if [ $file != $curDir/setup.sh ] || [ $file != $curDir/pre-install ] || [ $file != $curDir/post-install ]; then
    #sh $file
  #fi
#done

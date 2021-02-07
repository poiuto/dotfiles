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
  sudo pacman -Sy --noconfirm base-devel curl wget
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  sudo rm -rf yay
  # make pacman and yay colorful and adds eye candy on the progress bar because why not
  grep -q "^Color" /etc/pacman.conf || sed -i "s/^#Color$/Color/" /etc/pacman.conf
  grep -q "ILoveCandy" /etc/pacman.conf || sed -i "/#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf

  echo "=========================== zsh ==========================="
  sudo pacman -Sy --noconfirm zsh
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
  sudo pacman -Sy --noconfirm xorg xorg-server xorg-xinit xorg-xprop xorg-blacklight xorg-xwininfo xf86-video-intel slock xautolock

  # take quick screenshots
  sudo pacman -Sy --noconfirm maim

  echo "=========================== NTFS FAT ==========================="
  sudo pacman -Sy --noconfirm ntfs-3g simple-mtpfs exfat-utils

  #echo "=========================== xfce ==========================="
  #sudo pacman -Sy --noconfirm xfce4 xfce4-goodies gvfs
  #yay -Sy --noconfirm xfce-polkit

  echo "=========================== bat ==========================="
  sudo pacman -Sy --noconfirm bat tree

  echo "=========================== fzf ==========================="
  sudo pacman -Sy --noconfirm fzf

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
  sudo rm -rf /opt/shell-color-scripts/colorscripts/pukeskull

  for file in /opt/shell-color-scripts/colorscripts/*
  do
    sudo sed -i '/This should/d' $file
  done

  sudo sed -i '/echo "\${random_colorscript}"/d' /usr/bin/colorscript

  echo "=========================== firefox ==========================="
  sudo pacman -Sy --noconfirm firefox
  echo "=> copying firefox files"
  sudo sh $HOME/.config/firefox/copy-ff-config.sh
  # tridactyl
  curl -fsSl https://raw.githubusercontent.com/tridactyl/tridactyl/master/native/install.sh -o /tmp/trinativeinstall.sh && sh /tmp/trinativeinstall.sh 1.20.4

  echo "=========================== i3-gaps ==========================="
  sudo pacman -Sy --noconfirm i3-gaps unclutter xwallpaper rofi dmenu
  yay -Sy --noconfirm polybar

  echo "=========================== kitty ==========================="
  sudo pacman -Sy --noconfirm kitty

  echo "=========================== lf ==========================="
  yay -Sy --noconfirm lf sxiv highlight zathura zathura-pdf-mupdf poppler mediainfo w3m atool chafa odt2txt

  echo "=========================== npm ==========================="
  sudo pacman -Sy --noconfirm npm nodejs

  echo "=========================== nvim ==========================="
  sudo pacman -Sy --noconfirm vim neovim python-pynvim vim-clap xclip

  echo "=========================== ripgrep ==========================="
  sudo pacman -Sy --noconfirm ripgrep

  echo "=========================== tmux ==========================="
  sudo pacman -Sy --noconfirm tmux
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/bin/install_plugins

  echo "=========================== xcape ==========================="
  sudo pacman -Sy --noconfirm gcc make pkg-config xcape

  echo "=========================== mircrocode INTEL ==========================="
  sudo pacman -Sy --noconfirm intel-ucode

  echo "=========================== fonts ==========================="
  sudo pacman -Sy --noconfirm adobe-source-sans-pro-fonts ttf-dejavu ttf-linux-libertine ttf-inconsolata # noto-fonts

  echo "=========================== libreoffice, discord ==========================="
  sudo pacman -Sy --noconfirm libreoffice discord
  #yay -Sy --noconfirm enchant mythes-en ttf-liberation hunspell-en_US ttf-bitstream-vera pkgstats adobe-source-sans-pro-fonts gst-plugins-good ttf-droid ttf-dejavu aspell-en icedtea-web gst-libav ttf-ubuntu-font-family ttf-anonymous-pro jre8-openjdk languagetool libmythes

  echo "=========================== vlc ==========================="
  sudo pacman -Sy --noconfirm vlc

  echo "=========================== audio ==========================="
  sudo pacman -Sy --noconfirm pulseaudio pulseaudio-alsa pamixer pulsemixer 

  echo "=========================== redshift ==========================="
  sudo pacman -Sy --noconfirm redshift-minimal xorg-xbacklight
  chmod +x ~/.config/redshift/hooks/brightness.sh
  #sudo echo "[redshift]
  #allowed=true
  #system=false
  #users=" >> /etc/geoclue/geoclue.conf
  #sudo systemctl --user enable redshift.service --now

  echo "=========================== LTS kernel ==========================="
  sudo pacman -Sy --noconfirm linux-lts linux-lts-headers || { exit 1; }

  echo "=========================== removing orphans ==========================="
  sudo pacman -Rns --noconfirm $(pacman -Qtdq)
  sudo grub-mkconfig -o /boot/grub/grub.cfg

  echo "=========================== zip ==========================="
  yay -Sy --noconfirm zip unzip rar tar rsync
  
  # getting rid of that retarded error beep sound...
  sudo rmmod pcspkr
  sudo bash -c 'echo "blacklist pscpkr" > /etc/modprobe.d/nobeep.conf'

else
  ####################################################################
  ####################################################################
  ############################ for ubuntu ############################
  ####################################################################
  ####################################################################
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
  sudo rm -rf /opt/shell-color-scripts/colorscripts/pukeskull

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

#!/bin/bash

# connect to wifi
#nmcli device
#nmcli device wifi rescan
#nmcli device wifi list
#nmcli device wifi connect SSID password wireless-password

# exit if any command fails

# block mouse
# sudo bash -c 'echo "blacklist psmouse" > /etc/modprobe.d/blacklist-touch.conf'

set -e

if [ -f "/etc/arch-release" ]; then
  echo "=========================== reflector ==========================="
  sudo pacman -Sy --noconfirm reflector
  sudo reflector --verbose --completion-percent 100 --ipv6 --protocol https --score 50 --sort rate --save /etc/pacman.d/mirrorlist

  echo "=========================== update ==========================="
  sudo pacman -Syyu --noconfirm

  echo "=========================== clean the package cache ==========================="
  sudo pacman -Sy --noconfirm pacman-contrib
  sudo mkdir /etc/pacman.d/hooks
  sudo bash -c 'echo "[Trigger]
Operation = Upgrade
Operation = Install
Operation = Remove
Type = Package
Target = *
[Action]
Description = Cleaning pacman cache...
When = PostTransaction
Exec = /usr/bin/paccache -r" > /etc/pacman.d/hooks/clean_package_cache.hook'

  echo "=========================== git ==========================="
  sudo pacman -Sy --noconfirm curl wget tk git lazygit

  echo "=========================== yay ==========================="
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  sudo rm -rf yay
  # make pacman and yay colorful and adds eye candy on the progress bar because why not
  sudo grep -q "^Color" /etc/pacman.conf || sudo sed -i "s/^#Color$/Color/" /etc/pacman.conf
  sudo grep -q "ILoveCandy" /etc/pacman.conf || sudo sed -i "/#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf

  echo "=========================== xorg ==========================="
  sudo pacman -Sy --noconfirm xorg xorg-server xorg-xinit xorg-xprop xorg-xbacklight xorg-xwininfo arandr xf86-video-intel slock xautolock

  echo "=========================== input ==========================="
  yay -Syu --noconfirm rofi-greenclip
  systemctl --user enable greenclip.service
  # sudo bash -c "echo 'options psmouse proto=imps' > /etc/modprobe.d/psmouse.conf"
  # sudo pacman -Sy --noconfirm xf86-input-synaptics
  # yay -Sy --noconfirm xf86-input-evdev-trackpoint
  # /etc/X11/xorg.conf.d/70-synaptics.conf
  # Section "InputClass"
  #     Identifier "touchpad"
  #     Driver "synaptics"
  #     MatchIsTouchpad "on"
  #         Option "TapButton1" "1"
  #         Option "TapButton2" "3"
  #         Option "TapButton3" "2"
  #         Option "VertTwoFingerScroll" "on"
  #         Option "HorizTwoFingerScroll" "on"
  #         Option "CircularScrolling" "on"
  #         Option "CircScrollTrigger" "2"
  #         Option "EmulateTwoFingerMinZ" "40"
  #         Option "EmulateTwoFingerMinW" "8"
  #         Option "CoastingSpeed" "0"
  #         Option "FingerLow" "10"
  #         Option "FingerHigh" "20"
  #         Option "MaxTapTime" "200"
  # EndSection

  echo "=========================== nvidia ==========================="
  yay -Sy --noconfirm nvidia-340xx-dkms nvidia-340xx-lts nvidia-340xx-utils
   
  echo "=========================== slock ==========================="
  sudo pacman -Sy --noconfirm slock xautolock
  # lock the screen on resume from suspend
  sudo sh $HOME/.config/scripts/services/service-lockscreen-on-suspend.sh

  echo "=========================== screenshot, recording ==========================="
  sudo pacman -Sy --noconfirm flameshot simplescreenrecorder
  # scan qr code dependencies
  sudo pacman -Sy --noconfirm maim zbar qrencode

  echo "=========================== NTFS FAT ==========================="
  sudo pacman -Sy --noconfirm ntfs-3g exfat-utils
  yay -Sy --noconfirm simple-mtpfs

  #echo "=========================== xfce ==========================="
  #sudo pacman -Sy --noconfirm xfce4 xfce4-goodies gvfs
  #yay -Sy --noconfirm xfce-polkit

  echo "=========================== zsh ==========================="
  sudo pacman -Sy --noconfirm zsh
  # oh-my-zsh
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  # Fast Syntax Highlighting
  git clone https://github.com/zdharma/fast-syntax-highlighting.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
  # ZSH Autosuggestions 
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  # p10k
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  #git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  # set zsh as default
  chsh -s /bin/zsh

  echo "=========================== bat ==========================="
  sudo pacman -Sy --noconfirm bat tree

  echo "=========================== fzf ==========================="
  sudo pacman -Sy --noconfirm fzf

  echo "=========================== colorscripts ==========================="
  # sudo rm -rf shell-color-scripts || true
  # git clone https://gitlab.com/dwt1/shell-color-scripts.git
  # cd shell-color-scripts
  # sudo rm -rf /opt/shell-color-scripts || return 1
  # sudo mkdir -p /opt/shell-color-scripts/colorscripts || return 1
  # sudo cp -rf colorscripts/* /opt/shell-color-scripts/colorscripts
  # sudo cp colorscript.sh /usr/bin/colorscript
  # sudo rm -rf ../shell-color-scripts
  # sudo rm -rf /opt/shell-color-scripts/colorscripts/pipes*
  # sudo rm -rf /opt/shell-color-scripts/colorscripts/pukeskull

  # for file in /opt/shell-color-scripts/colorscripts/*
  # do
  #   sudo sed -i '/This should/d' $file
  # done

  # sudo sed -i '/echo "\${random_colorscript}"/d' /usr/bin/colorscript

  ############## pokemon-colorscripts ##############
  yay -Sy --noconfirm pokemon-colorscripts-git
  # sudo rm -rf /usr/local/bin/pokemon-colorscripts /usr/local/opt/pokemon-colorscripts || true
  # git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git
  # cd pokemon-colorscripts
  # sudo ./install.sh
  # cd ..
  # sudo rm -rf pokemon-colorscripts

  echo "=========================== firefox ==========================="
  sudo pacman -Sy --noconfirm firefox
  # set firefox as default
  xdg-mime default firefox.desktop x-scheme-handler/http
  xdg-mime default firefox.desktop x-scheme-handler/https   
  echo "=> copying firefox files"
  sudo sh $HOME/.config/firefox/copy-ff-config.sh
  # tridactyl
  sudo curl -fsSl https://raw.githubusercontent.com/tridactyl/tridactyl/master/native/install.sh -o /tmp/trinativeinstall.sh && sudo sh /tmp/trinativeinstall.sh 1.20.4

  echo "=========================== i3-gaps ==========================="
  sudo pacman -Sy --noconfirm i3-gaps unclutter xwallpaper
  yay -Sy --noconfirm polybar

  echo "=========================== rofi & dmenu ==========================="
  sudo pacman -Sy --noconfirm rofi dmenu
  yay -Sy --noconfirm rofi-emoji xsel 

  echo "=========================== themes & icons ==========================="
  yay -Sy --noconfirm yaru-icon-theme yaru-colors-gtk-theme yaru-colors-icon-theme

  echo "=========================== file manager ==========================="
  sudo pacman -Sy --noconfirm exa file-roller
  yay -Sy --noconfirm lf thunar tumbler gvfs sxiv highlight zathura zathura-pdf-mupdf poppler mediainfo w3m atool chafa odt2txt

  echo "=========================== calcurse ==========================="
  sudo pacman -Sy --noconfirm calcurse

  echo "=========================== dunst ==========================="
  sudo pacman -Sy --noconfirm dunst

  echo "=========================== kitty ==========================="
  sudo pacman -Sy --noconfirm kitty

  echo "=========================== npm ==========================="
  sudo pacman -Sy --noconfirm npm nodejs

  echo "=========================== nvim ==========================="
  sudo pacman -Sy --noconfirm vim neovim
  # dependencies
  sudo pacman -Sy --noconfirm fd ueberzug bc python-pynvim xclip
  nvim --headless +PlugUpgrade +'PlugInstall --sync' +qa &> /dev/null &

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
  sudo pacman -Sy --noconfirm adobe-source-sans-pro-fonts ttf-dejavu ttf-linux-libertine ttf-inconsolata noto-fonts-cjk noto-fonts-emoji noto-fonts

  echo "=========================== fcitx ==========================="
  sudo pacman -Sy --noconfirm fcitx fcitx-unikey fcitx-qt5

  echo "=========================== libreoffice, discord ==========================="
  sudo pacman -Sy --noconfirm libreoffice discord
  #yay -Sy --noconfirm enchant mythes-en ttf-liberation hunspell-en_US ttf-bitstream-vera pkgstats adobe-source-sans-pro-fonts gst-plugins-good ttf-droid ttf-dejavu aspell-en icedtea-web gst-libav ttf-ubuntu-font-family ttf-anonymous-pro jre8-openjdk languagetool libmythes

  echo "=========================== mpv ==========================="
  sudo pacman -Sy --noconfirm mpv vlc

  echo "=========================== audio ==========================="
  sudo pacman -Sy --noconfirm alsa-utils pulseaudio pulseaudio-alsa pamixer pulsemixer 
  # UI
  sudo pacman -Sy --noconfirm pavucontrol

  echo "=========================== redshift ==========================="
  yay -Sy --noconfirm redshift-minimal
  sudo chmod +x ~/.config/redshift/hooks/brightness.sh
  #sudo echo "[redshift]
  #allowed=true
  #system=false
  #users=" >> /etc/geoclue/geoclue.conf
  #sudo systemctl --user enable redshift.service --now

  echo "=========================== services ==========================="
  # battery notification
  yay -Sy --noconfirm acpi light
  systemctl --user daemon-reload
  systemctl --user enable battery-notification.service

  echo "=========================== LTS kernel ==========================="
  #sudo pacman -Sy --noconfirm linux-lts linux-lts-headers || { exit 1; }

  echo "=========================== removing orphans ==========================="
  sudo pacman -Rns --noconfirm $(pacman -Qtdq)
  # sudo grub-mkconfig -o /boot/grub/grub.cfg

  echo "=========================== zip ==========================="
  yay -Sy --noconfirm zip unzip rar tar rsync
  
  # getting rid of that retarded error beep sound...
  sudo rmmod pcspkr
  sudo bash -c 'echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf'

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

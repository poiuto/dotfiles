if [ -f "/etc/arch-release" ]; then
  sudo pacman -Syu
else
  sudo apt-get update
  sudo apt-get upgrade
fi

for file in ~/.setup/*
do
  sh $file
done

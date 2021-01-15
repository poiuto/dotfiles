echo "==> installing colorscript"
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

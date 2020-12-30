sudo apt-get update
sudo apt-get upgrade
for file in ~/.setup/*
do
  sh $file
done

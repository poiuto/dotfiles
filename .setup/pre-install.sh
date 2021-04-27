# iwctl
#device list
#station 'device' get-networks
#station 'device' connect 'SSID'

EFI_partition="/dev/sda1"
swap_partitio="/dev/sda2"
root_partition="/dev/sda3"
#Using fdisk:
#fdisk -l   (lists out the partitions)
#fdisk /dev/sda  
#In fdisk, "m" for help
#In fdisk, "o" for DOS partition or "g" for GPT
#In fdisk, "n" for add new partition
#In fdisk, "p" for primary partition (if using MBR instead of GPT)
#In fdisk, "t" to change partition type
#In fdisk, "w" (write table to disk)

#Make filesystem:
mkfs.fat -F32 $EFI_partition
mkswap $swap_partition
swapon $swap_partition
mkfs.ext4 $root_partition

#Base Install:
mount $root_partition /mnt #(mounts it to mnt on live image)
yes '' | pacstrap /mnt base base-devel linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

#Chroot:
arch-chroot /mnt #(change into root directory of our new installation)
ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
hwclock --systohc #(sets the hardware clock)
pacman -S vim
# vim /etc/locale.gen
# locale-gen
sed -i 's/^#en_US\.UTF-8 UTF-8/en_US\.UTF-8 UTF-8/g' /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
# vim /etc/hostname
echo 'archbox' > /etc/hostname
# vim /etc/hosts
echo "127.0.0.1	localhost
::1		localhost
127.0.0.1	archbox.localdomain	archbox" > /etc/hosts


#Users and passwords:
passwd #(set root pass)
useradd -m poiuto
passwd poiuto
usermod -aG wheel,audio,video,optical,storage poiuto

#Sudo:
pacman -S sudo
#visudo
# uncomment wheel
sed -i "/NOPASSWD/s/^#//g" /etc/sudoers

#GRUB:
pacman -Sy --noconfirm grub efibootmgr dosfstools os-prober mtools #(if doing UEFI)
mkdir /boot/EFI #(if doing UEFI)
mount $EFI_partition /boot/EFI  #Mount FAT32 EFI partition (if doing UEFI)
#grub-install --target=x86_64-efi  --bootloader-id=grub_uefi --recheck # (if doing UEFI)
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/EFI --removable
grub-mkconfig -o /boot/grub/grub.cfg

#Networking:
pacman -Sy --noconfirm networkmanager network-manager-applet wpa_supplicant wireless_tools netctl
systemctl enable NetworkManager.service wpa_supplicant.service

#Reboot:
exit #the chroot by typing "exit"
umount -R /mnt #(unmounts /mnt)

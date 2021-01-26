# iwctl
#device list
#station 'device' get-networks
#station 'device' connect 'SSID'

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
mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mkfs.ext4 /dev/sda3

#Base Install:
mount /dev/sda3 /mnt #(mounts it to mnt on live image)
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

#Chroot:
arch-chroot /mnt #(change into root directory of our new installation)
ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
hwclock --systohc #(sets the hardware clock)
pacman -S vim
vim /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
vim /etc/hostname
vim /etc/hosts
#127.0.0.1	localhost
#::1		localhost
#127.0.0.1	localhost.localdomain	archbox


#Users and passwords:
passwd #(set root pass)
useradd -m poiuto #(make another user)
passwd poiuto #(set that user's password)
usermod -aG wheel,audio,video,optical,storage poiuto

#Sudo:
# uncomment wheel
pacman -S sudo
visudo

#GRUB:
pacman -S grub efibootmgr dosfstools os-prober mtools #(if doing UEFI)
mkdir /boot/EFI #(if doing UEFI)
mount /dev/sda1 /boot/EFI  #Mount FAT32 EFI partition (if doing UEFI)
#grub-install --target=x86_64-efi  --bootloader-id=grub_uefi --recheck # (if doing UEFI)
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/EFI --removable
grub-mkconfig -o /boot/grub/grub.cfg

#Networking:
pacman -S --noconfirm networkmanager network-manager-applet wpa_supplicant wireless_tools netctl
systemctl enable NetworkManager.service wpa_supplicant.service

#Reboot:
exit #the chroot by typing "exit"
umount -R /mnt #(unmounts /mnt)
#reboot (or shutdown now if doing this in VirtualbBox)
#Remember to detach the ISO in VirtualBox before reboot.

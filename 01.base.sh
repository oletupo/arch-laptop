#!/bin/bash

# Prerequisites
sudo pacman -Syyu --noconfirm --needed base base-devel linux-firmware linux intel-ucode reflector
# reflector mirror list
sudo reflector -c Spain -a 12 --sort rate --save /etc/pacman.d/mirrorlist
# Xorg
sudo pacman -S --noconfirm --needed xorg xf86-video-fbdev
# wifi support
sudo pacman -S --noconfirm --needed wpa_supplicant networkmanager network-manager-applet
# Dm and greeter
sudo pacman -S --noconfirm --needed lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
# desktop enviorment base apps
sudo pacman -S --noconfirm firefox qtile picom rofi alacritty xfce4-terminal vim geany thunar ranger mpv
# Configuration and utilities
sudo pacman -S --noconfirm lxappearance nitrogen numlockx xdg-user-dirs udiskie polkit pacman-contrib thunar-volman xfce4-notifyd polkit-gnome p7zip pulseaudio pavucontrol neofetch htop
# fuse 
# Themes and fonts
sudo pacman -S --noconfirm arc-gtk-theme arc-icon-theme ttf-jetbrains-mono

# Nvidia Drivers
#sudo pacman -S --noconfirm nvidia
#sudo pacman -S --noconfirm  
# AMD Drivers
#sudo pacman -S --noconfirm amd-ucode
#sudo pacman -S --noconfirm vulkan-radeon lib32-vulkan-radeon

# Services
sudo systemctl enable lightdm
sudo systemctl enable NetworkManager
sudo systemctl enable reflector.service

# Config files
cp -Rf .config ~/
# cp .local/share (scripts?)

# Default directories
xdg-user-dirs-update

# AUR (paru)
#git clone https://aur.archlinux.org/paru.git
#cd paru/
#makepkg -si --noconfirm

# AUR
#sudo paru -S --noconfirm ttf-noto-nerd joplin visual-studio-code-bin
# sudo paru -S --noconfirm visual-studio-code-bin

# Reboot 
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot

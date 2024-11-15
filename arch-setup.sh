# Update system and sync packages
sudo pacman -Syu 

# Bluetooth setup 
sudo pacman -S bluez bluez-utils
bluetoothctl start bluetooth.service
bluetoothctl enable bluetooth.service

# Bluetooth pairing 
bluetoothctl
power on 
default-agent
scan on # Find your device and copy MAC address
trust <mac-address> # Replace <mac-address> with your device's MAC address
pair <mac-address> # Replace <mac-address> with your device's MAC address
connect <mac-address> # Replace <mac-address> with your device's MAC address
scan off
sudo vim /etc/bluetooth/main.conf # Change "AutoEnable=false" to "true" 

# Install yay to install apps from AUR
sudo pacman -Syu
sudo pacman -S base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Mirrors with Reflector 
sudo pacman -S reflector 
sudo reflector --verbose --sort rate -l 70 -c US --protocol https --save /etc/pacman.d/mirrorlist 


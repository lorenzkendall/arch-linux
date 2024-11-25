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

# Install UFW firewall 
sudo pacman -S ufw
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable 
sudo systemctl enable ufw
sudo ufw status

# Install yay to install apps from AUR
sudo pacman -Syu
sudo pacman -S base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Set fastest mirrors using Reflector 
sudo pacman -S reflector 
sudo reflector --verbose --sort rate -l 70 -c US --protocol https --save /etc/pacman.d/mirrorlist 

# Speedtest CLI
sudo pacman -S speedtest-cli

# Bash command aliases
sudo vim ~/.bashrc 
alias c='clear'
alias p='ping 1.1.1.1"
alias u='sudo pacman -Syu'
alias n='neofetch'
alias s='speedtest-cli --secure'

# Backups with Timeshift
sudo pacman -S timeshift
# Launch Timeshift GUI from Application Launcher
# Create a snapshot on your local drive, then upload it to cloud storage


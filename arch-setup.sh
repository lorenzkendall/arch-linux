# Bluetooth setup
sudo pacman -S bluez bluez-utils
bluetoothctl start bluetooth.service
bluetoothctl enable bluetooth.service

# Pair bluetooth via terminal 
bluetoothctl
power on 
default-agent
scan on 
# Find your device and copy MAC address
trust <mac-address> # Replace <mac-address> with your device's MAC address
pair <mac-address> # Replace <mac-address> with your device's MAC address
connect <mac-address> # Replace <mac-address> with your device's MAC address
scan off
sudo vim /etc/bluetooth/main.conf 
# Change "AutoEnable=false" to "true" 

# Install Reflector to get the fastest mirrors for pacman 
sudo pacman -S reflector 
sudo reflector --verbose --sort rate -l 70 -c US --protocol https --save /etc/pacman.d/mirrorlist 

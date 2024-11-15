# 

# Install Reflector to get the fastest mirrors for pacman 
sudo pacman -S reflector 
sudo reflector --verbose --sort rate -l 70 -c US --protocol https --save /etc/pacman.d/mirrorlist 


#!/bin/bash
#create vm

#login ssh

#install chrome remote desktop https://cloud.google.com/architecture/chrome-desktop-remote-on-compute-engine
#https://en.linuxportal.info/tutorials/troubleshooting/how-can-we-manually-unmask-services-that-are-masked-service-is-masked-that-we-cannot-unmask-with-the-unmask-option-of-the-systemctl-command

curl -L -o chrome-remote-desktop_115.0.5790.10_amd64.deb \
    https://deb.rug.nl/ppa/mirror/dl.google.com/linux/chrome-remote-desktop/deb/pool/main/c/chrome-remote-desktop/chrome-remote-desktop_115.0.5790.10_amd64.deb
sudo DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes ./chrome-remote-desktop_115.0.5790.10_amd64.deb

    
sudo apt update
#curl -L -o chrome-remote-desktop_current_amd64.deb \
#    https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
#sudo DEBIAN_FRONTEND=noninteractive \
#    apt-get install --assume-yes ./chrome-remote-desktop_current_amd64.deb


sudo DEBIAN_FRONTEND=noninteractive \
    apt install --assume-yes xfce4 desktop-base dbus-x11 xscreensaver
    
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'

sudo systemctl disable lightdm.service

curl -L -o google-chrome-stable_current_amd64.deb \
    https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo apt install --assume-yes ./google-chrome-stable_current_amd64.deb

#sudo adduser engli
#sudo passwd engli

#usermod -aG sudo engli
#sudo su
#vi /etc/sudoers

#i
#engli ALL=(ALL:ALL) ALL

#:wq!


# Check if running as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 
   exit 1
fi

# Add the user to sudoers file using visudo
echo "engli ALL=(ALL:ALL) ALL" >> /etc/sudoers

# Validate the sudoers file
visudo -c
if [ "$?" -eq "0" ]; then
   echo "Sudoers file valid"
else
   echo "Sudoers file has a syntax error. Backing from the changes."
   cp /etc/sudoers.bak /etc/sudoers
fi


sudo apt install git

sudo apt update

sudo apt install nodejs

sudo apt install npm

sudo apt install ufw



#mkdir ~/.config/chrome-remote-desktop

#sudo systemctl status chrome-remote-desktop@$USER

#sudo service chrome-remote-desktop restart

#sudo usermod -a -G chrome-remote-desktop $USER

#sudo groupadd chrome-remote-desktop usermod -a -G chrome-remote-desktop

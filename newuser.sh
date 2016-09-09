#!/bin/bash
user=$1
sudo groupadd $1
sudo useradd -m -s /bin/bash -g $1 $1
sudo passwd $1
ssh-keygen -f /home/kelwing/pems/$user.pem
sudo -u $user mkdir -p /home/$user/.ssh
cat /home/kelwing/pems/$user.pem.pub | sudo -u $user tee /home/$user/.ssh/authorized_keys
sudo -u $user chmod 770 /home/$user
sudo -u $user chmod 700 /home/$user/.ssh
sudo -u $user chmod 600 /home/$user/.ssh/authorized_keys

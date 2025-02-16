We will install a debian OS
After we are in, we are gonna run the classics:

sudo su
apt update
sudo apt-get update
apt upgrade

and then the software dependencies:

apt install -y sudo ufw docker docker-compose make openbox xinit kitty firefox-esr



then we need to setup port forwarding from the virtual OS to the host machine
I did not have ssh_config in my OS, so I have to run:

sudo apt-get -o Dpkg::Options::="--force-confask" install --reinstall openssh-server


then I go to:

nano /etc/ssh/sshd_config
here i do three thinsg:
uncomment the port (it is #port 22) and change it to port 42
secondly change PermitRootLogin - I uncomment it and change it to PermitRootLogin yes
thirdly find PubkeyAuthentication and chnage it to no

ok this is good so now I can save with ctrl+x and y and enter
then i restart the services;

service ssh restart
service sshd restart

i can check it runs with 
service ssh status

afterwards we allow firewal (ufw)
so first 

ufw enable

then we allow the ports we want to enable (this is important, if you mess up you can lock yourself out of the computer if you really fucking dont know what your doing and abort this process somewhere - lol)

ufw allow 443
ufw allow 80
ufw allow 42

and check with ufw status, you should see which ports allow communication and in which direction

afterwards, we restart using the shutdown now command (the now keyword apparently drastically speeds this process up)

shutdown now


(continue at https://github.com/codesshaman/inception/blob/main/02_PORTS_FORWARDING.md)

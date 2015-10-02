#!/bin/bash
cd
export vm_dir=galaxy_install
mkdir $HOME/$vm_dir
cd $HOME/$vm_dir

sudo apt-get install vim git python2.7 software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y

echo "[ARTiMED_host_servers]" > $HOME/$vm_dir/ansible_hosts
echo "127.0.0.1" >> $HOME/$vm_dir/ansible_hosts
export ANSIBLE_INVENTORY=$HOME/$vm_dir/ansible_hosts
if git clone https://github.com/fabiorjvieira/general.git 
then
	sed "s/???vm_dir???/$vm_dir/" ARTiMED.prototype.yml > ARTiMED.yml
	ansible-playbook $HOME/$vm_dir/ARTiMED.yml --become-user=root
fi
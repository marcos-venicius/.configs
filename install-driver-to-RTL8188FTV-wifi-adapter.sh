#!/bin/bash

# Configure RTL8188FTV wifi adapter driver

folder_name="rtl8188fu-installation-process"

sudo apt-get update
sudo apt-get -y install build-essential git dkms linux-headers-$(uname -r)
cd /tmp
mkdir $folder_name
cd $folder_name
git clone https://github.com/kelebek333/rtl8188fu
sudo dkms add ./rtl8188fu
sudo dkms build rtl8188fu/1.0
sudo dkms install rtl8188fu/1.0
sudo cp ./rtl8188fu/firmware/rtl8188fufw.bin /lib/firmware/rtlwifi/
mkdir -p /etc/modprobe.d/
touch /etc/modprobe.d/rtl8188fu.conf
echo "options rtl8188fu rtw_power_mgnt=0 rtw_enusbss=0" | sudo tee /etc/modprobe.d/rtl8188fu.conf

clear

echo "PLEASE, RESTART YOUR SYSTEM"

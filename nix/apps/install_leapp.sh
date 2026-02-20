#!/bin/bash

cd /tmp
mkdir Leapp
cd Leapp

wget -O Leapp.deb https://asset.noovolari.com/latest/Leapp-deb.zip
unzip Leapp.deb
sudo dpkg -i release/Leapp*.deb

rm -rf /tmp/Leapp/Leapp.deb

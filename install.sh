#! /bin/bash

echo "Downloading the required files from the GitHub page ..."

git clone https://github.com/Frill7742/Lilith-Docker.git

cd Lilith-Docker/Lilith/

cp -r .container ~ && chmod -R 777 ~/.container 

cp start-lilith.sh ~/Documents/ && chmod 700 ~/Documents/start-lilith.sh 

cp stop-lilith.sh ~/Documents/ && chmod 700 ~/Documents/stop-lilith.sh


cd ../..

rm -rf Lilith-Docker

mkdir ~/.container/lilith/launcher

echo "Downloading Lilith ..."

wget https://github.com/lilithmod/launcher/releases/download/stable-3/lilith-launcher-linux-s3
mv ~/Downloads/lilith-launcher-linux-s3 ~/.container/lilith/launcher/lilith-launcher && chmod 770 ~/.container/lilith/launcher/lilith-launcher

echo "--------------------------"
echo "Installation finished!"
echo "--------------------------"

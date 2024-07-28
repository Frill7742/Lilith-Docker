#! /bin/bash

echo "Downloading the required files from the GitHub page ..."

git clone https://github.com/Frill7742/Lilith-Docker.git

cd Lilith-Docker/Lilith/

cp -r .container ~
chmod -R 777 ~/.container 

cp start-lilith.sh ~/Documents/ && cp stop-lilith.sh ~/Documents/
chmod 700 ~/Documents/start-lilith.sh && chmod 700 ~/Documents/stop-lilith.sh

cd ../..

rm -rf Lilith-Docker

mkdir ~/.container/lilith/launcher

echo "--------------------------"
echo "Installation finished!"
echo " "
echo "You need to provide the lilith launcher file."
echo 'The file should be inserted in ~/.container/lilith/launcher/ and renamed to "lilith-launcher".'
echo 'You can do this with the command "mv ~/Downloads/lilith-launcher-linux-s3 ~/.container/lilith/launcher/lilith-launcher && chmod 770 ~/.container/lilith/launcher/lilith-launcher", but please download the file first (https://lilith.rip/download)!'
echo "--------------------------"

#!/bin/sh

echo 'Updating System\n'
sudo apt-get update

#Dependencies that might not be needed (just precaution)
sudo apt-get install build-essential
sudo apt-get install linux-headers-$(uname -r)

#Dependencies
echo 'Downloading dependencies\n'
sudo apt-get install qt4-qmake libqt4-dev build-essential libboost-dev libboost-system-dev \
libboost-filesystem-dev libboost-program-options-dev libboost-thread-dev \
libssl-dev libdb-dev libdb++-dev
myPATH=$(pwd)

#Setup MiniUPnP
echo 'Downloading and installing MiniUPnP\n'
cd ~/Downloads/
wget "http://miniupnp.tuxfamily.org/files/download.php?file=miniupnpc-1.9.20150206.tar.gz"

tar zxvf download.php\?file\=miniupnpc-1.9.20150206.tar.gz
rm download.php\?file\=miniupnpc-1.9.20150206.tar.gz
cd miniupnpc-1.9.20150206
sudo make install
cd ..
sudo rm -r miniupnpc-1.9.20150206

#Compiling
echo 'Compiling'
cd $myPATH/../..
qmake
make


#!/bin/bash
set -x

echo $PWD
#cd $CI_HOME
#echo $PWD
sudo apt-get update -qq
sudo apt-get install -y realpath qemu-user-static curl pv
modprobe loop
if [ ! -f src/image/*.zip ]
then
  pushd src/image/
   $(curl -J -O -L  http://downloads.raspberrypi.org/raspbian_latest)
  popd
else
  echo "zip already present"
fi

pushd src/
sudo bash -x build
popd


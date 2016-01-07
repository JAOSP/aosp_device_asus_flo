#!/bin/sh

VENDOR=asus
DEVICE=flo

echo "Please wait..."
wget -nc -q https://dl.google.com/dl/android/aosp/razor-mmb29o-factory-dfe7fcb2.tgz
tar zxf razor-mmb29o-factory-dfe7fcb2.tgz
rm razor-mmb29o-factory-dfe7fcb2.tgz
cd razor-mmb29o
unzip image-razor-mmb29o.zip
cd ../
./simg2img razor-mmb29o/system.img system.ext4.img
mkdir system
sudo mount -o loop -t ext4 system.ext4.img system

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

for FILE in `cat proprietary-blobs.txt | grep -v ^# | grep -v ^$ | sed -e 's#^/system/##g'| sed -e "s#^-/system/##g"`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    cp system/$FILE $BASE/$FILE

done

./setup-makefiles.sh

sudo umount system
rm -rf system
rm -rf razor-mmb29o
rm system.ext4.img

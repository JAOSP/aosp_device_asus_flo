#!/bin/sh

VENDOR=asus
DEVICE=flo

echo "Please wait..."
wget -nc -q https://dl.google.com/dl/android/aosp/razor-mra58k-factory-300dc903.tgz
tar zxf razor-mra58k-factory-300dc903.tgz
rm razor-mra58k-factory-300dc903.tgz
cd razor-mra58k
unzip image-razor-mra58k.zip
cd ../
./simg2img razor-mra58k/system.img system.ext4.img
mkdir system
sudo mount -o loop -t ext4 system.ext4.img system

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

for FILE in `cat proprietary-blobs.txt | grep -v ^# | grep -v ^$ | sed -e 's#^/system/##g'| sed -e "s#^-/system/##g"`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    echo "cp $FILE $BASE/$FILE"
    cp system/$FILE $BASE/$FILE

done

./setup-makefiles.sh

sudo umount system
rm -rf system
rm -rf razor-mra58k
rm system.ext4.img

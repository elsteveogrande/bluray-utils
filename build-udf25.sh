#!/bin/sh
         
# http://www.videohelp.com/forum/archive/how-to-burn-avchd-on-dvd-r-in-high-definition-for-br-set-top-playback-t350375.html

if [[ ! -d BDMV ]]
then
    echo "run in directory containing BDMV and CERTIFICATE directories"
    exit 1
fi

if [[ ! -f BDMV/index.bdmv ]]
then
    echo "malformed BDMV structure"
    exit 2
fi

LABEL=$1
if [[ -z $LABEL ]]
then
    echo "specify a volume label"
    exit 3
fi

FILE="$LABEL".img
if [[ -f $FILE ]]
then
    echo "already exists: $FILE"
    exit 4
fi

TARGET=/Volumes/$LABEL
if [[ -d $TARGET ]]
then
    echo "is $TARGET already mounted?"
    exit 5
fi

# create a blank file that will contain our UDF filesystem
# should be a multiple of 2048, but multiple of 1M is ok too --
# leave a little extra space for padding / ISO structures / rounding up / etc
MEGABYTES=$((`du -sm BDMV | awk '{print $1}'` + 8))
                      
# create a blank file
dd if=/dev/zero of=$FILE bs=1048576 count=$MEGABYTES
                      
# create the UDF 2.5 filesystem within this file
newfs_udf -r 2.5 $FILE -v $LABEL

# mount it
hdiutil mount -nobrowse $FILE
               
# copy files
if [[ ! -d $TARGET ]]
then
    echo "target $TARGET not found??"
    exit 6
fi

cp -vrp CERTIFICATE BDMV $TARGET

# mount it
hdiutil unmount $TARGET


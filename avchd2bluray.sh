#!/bin/sh

# taken from original URL                                                                                                                                                                   
# cached:
# http://74.125.93.132/search?q=cache:Meaf0917ZyUJ:avchduser.com/articles/avchd_to_bluray.jsp+http://www.elurauser.com/articles/avchd_to_bluray.jsp&cd=1&hl=en&ct=clnk&gl=us

if [[ ! -d ./BDMV ]]
then
    echo "chdir to the directory containing the BDMV directory then run this"
    exit 1
fi

cd BDMV             

mv -v INDEX.BDM index.bdmv
mv -v MOVIEOBJ.BDM MovieObject.bdmv

for a in PLAYLIST/*.MPL
do
    b=`basename $a .MPL`.mpls
    mv -v $a PLAYLIST/$b
done

for a in CLIPINF/*.CPI
do
    b=`basename $a .CPI`.clpi
    mv -v $a CLIPINF/$b
done

for a in STREAM/*.MTS
do
    b=`basename $a .MTS`.m2ts
    mv -v $a STREAM/$b
done

mkdir -v BDJO
mkdir -v JAR
mkdir -v AUXDATA

mkdir -v BACKUP
cp -vrp index.bdmv MovieObject.bdmv PLAYLIST CLIPINF BDJO   BACKUP/
                         
cd ..

mkdir -v -p CERTIFICATE/BACKUP



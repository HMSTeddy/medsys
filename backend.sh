#!/bin/bash
echo ===================
echo ENCOM INTERNATIONAL
echo ===================
echo  

if [[ $PWD = /tmp ]]; then
echo DECRYPT BLACK DATA? PRESS ANY KEY TO CONTINUE
read yes

if [[ $yes = encrypt ]]; then
echo RED DATA PATH?
read redpath
tar -czf blackdata.tar.gz $redpath
echo RED KEY: OCTET LENGTH?
read keylength
aescrypt_keygen -g $keylength red.key
aescrypt -e -k red.key blackdata.tar.gz
rm -rf ./blackdata.tar.gz
mv blackdata.tar.gz.aes blackdata
read hash < <(sha512sum blackdata)
printf $hash > ./hashauth
echo DONE
            else
cd /tmp/
echo BLACK DATA PATH?
read blackpath
echo RED KEY PATH?
read redkeypath
echo HASHAUTH PATH?
read hashauthpath
hash=`sha512sum blackdata | awk '{ print $1 }'`
hashhash=`cat $hashauthpath`
if [ "$hash" == "$hashhash" ] ;then
    echo "HASH CLEARED"
else
    echo "ERROR: HASH COMPROMISED"
fi
aescrypt -d -k $redkeypath $blackpath
tar -xvzf black
rm -rf black blackdata hashauth red.key
echo DONE
            fi
else
echo SECURITY FAILSAFE ACTIVATED. MUST RUN IN /tmp/. DO cd /tmp/.
fi


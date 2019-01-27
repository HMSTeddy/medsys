!/bin/sh


echo ENCOM INTERNATIONAL

wget https://www.aescrypt.com/download/v3/linux/AESCrypt-GUI-3.11-Linux-x86_64-Install.gz
gunzip AESCrypt-GUI-3.11-Linux-x86_64-Install.gz
chmod +x AESCrypt-GUI-3.11-Linux-x86_64-Install
./AESCrypt-GUI-3.11-Linux-x86_64-Install
rm -rf AESCrypt-GUI-3.11-Linux-x86_64-Install.sh
echo done

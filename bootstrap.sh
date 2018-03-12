#!/usr/bin/env bash
apt-get update
apt-get install -y build-essential git autoconf automake cmake pcscd libpcsclite-dev libccid pcsc-tools wget curl unzip

pushd /tmp

wget http://plex-net.co.jp/plex/px-s1ud/PX-S1UD_driver_Ver.1.0.1.zip
unzip PX-S1UD_driver_Ver.1.0.1.zip
cp -v PX-S1UD_driver_Ver.1.0.1/x64/amd64/isdbt_rio.inp /lib/firmware/

# wget https://github.com/stz2012/libarib25/archive/master.zip
# unzip master.zip
# pushd libarib25-master
git clone https://github.com/stz2012/libarib25.git
pushd libarib25
cmake .
make
make install
popd

wget http://www13.plala.or.jp/sat/recdvb/recdvb-1.3.1.tgz
tar xvzf recdvb-1.3.1.tgz
pushd recdvb-1.3.1
./autogen.sh
./configure --enable-b25
make 
make install
popd

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs

npm install pm2 -g
npm install mirakurun -g --unsafe --production

cat >> /usr/local/etc/mirakurun/tuners.yml <<EOF
- name: PX-S1UD-1
  types:
    - GR
  command: recdvb --b25 --dev 0 <channel> - -
EOF

mirakurun start

curl -X PUT "http://localhost:40772/api/config/channels/scan"

# back to home
popd

git clone git://github.com/kanreisa/Chinachu.git chinachu
pushd chinachu
./chinachu installer
cp config.sample.json config.json
pm2 start processes.json

cat >> /etc/hosts <<EOF
192.168.33.1 vagrant-host

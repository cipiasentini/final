#!/bin/bash
echo -e "\e[92mInstalando los requisitos obligatorios\e[0m"
sudo apt install -y python-pip
sudo apt install -y git
sudo apt-get install -y libzmq3-dev
pip install pyinstaller
pip install zerorpc
sudo apt install -y curl
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
git clone https://github.com/cipiasentini/final.git
cd final
npm install --runtime=electron --target=1.7.9
pyinstaller apriori/server.py --distpath aprioriDistribucion
rm -rf build/
rm -rf server.spec
./node_modules/.bin/electron-packager . --overwrite --icon="./iconito.ico" --ignore='apriori$'
echo -e "\e[92mEjecutable creado en: $(pwd)/final/apriori-linux-x64\e[0m"

#!/bin/bash

sudo echo "Europe/Moscow" | sudo tee /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata

sudo apt-get update -y
sudo apt-get install -y build-essential curl git libssl-dev man xclip libfuse-dev libcurl4-openssl-dev libxml2-dev mime-support automake libtool pkg-config unzip

# Build s3fs-fuse
mkdir -p ~/repo && cd "$_"
git clone https://github.com/s3fs-fuse/s3fs-fuse
cd s3fs-fuse/
./autogen.sh
./configure --prefix=/usr --with-openssl
make
sudo make install
cd ~/repo && rm -rf ~/repo/s3fs-fuse

# AWS tools
mkdir -p ~/repo/aws && cd "$_"
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
cd ~/repo && rm -rf ~/repo/aws


git config --global core.editor "vim" 

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

echo "source ~/.nvm/nvm.sh" >> ~/.profile

source ~/.profile

nvm install v6.9.1
nvm use v6.9.1
nvm alias default v6.9.1

npm install -g eslint
npm install -g live-server
npm install -g webpack
npm install -g gulp
npm install -g less
npm install -g bower

mkdir -p ~/repo
echo "cd ~/repo" >> ~/.profile

ssh-keyscan github.com >> ~/.ssh/known_hosts

echo ""
echo "Everything done, have a nice day :-)!"
echo ""
echo "Do not forget to set up GIT:"
echo ""
echo "$ git config --global user.name \"John Doe\""
echo "$ git config --global user.email johndoe@example.com"
echo "Then set up GITHUB: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-linux"


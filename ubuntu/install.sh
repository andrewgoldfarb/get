#! /bin/sh
mkdir -p ~/github/cloudmesh
cd ~/github/cloudmesh
git clone https://github.com/cloudmesh/cloudmesh.git
virtualenv ~/ENV
source ~/ENV/bin/activate
cd cloudmesh
sudo ./install system
./install requirements
./install new
./install rc fetch
./install rc fill
./install cloudmesh
fab mongo.start
fab mongo.boot
fab user.mongo
fab mongo.simple
fab server.start
cm cloud list
echo "y" | cm cloud on sierra
cm flavor sierra --refresh
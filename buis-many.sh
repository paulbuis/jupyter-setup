#! /bin/sh
#
# This is just a shell script version of
#
# https://github.com/paulbuis/jupyter-many/blob/master/Dockerfile
#
# and does not include any parts that need to be run with root privledges like apt-get
# we are blindly assuming that all the needed Linux distro packages are already installed
# such as:
#	file
#	libunwind-dev   (this one is often not installed, double check??)
#	fonts-dejavu
#	gfortran
# consider adding "sudo apt-get install -y --noistall-recommends" for the above packages
# as long as apt-get is the right Linux package manager for your distro

MINICONDA_VERSION=4.6.14
CONDA_VERSION=4.7.10
CONDA_DIR=$HOME/miniconda3
PATH=$CONDA_DIR/bin:$PATH

# install kernels for various versions of C++
conda install --quiet --yes 'xeus-cling=0.7.1'

# verify that npm is found at $HOME/miniconda3/bin/npm
# install both ijavascipt kernel and itypescript kernel
echo `which npm`
npm install -g ijavascript
ijsinstall
npm install -g itypescript
its --ts-hide-undefined --install=local

# install ijava kernel in $HOME/ijava
# consider making this $HOME/.ijava ???
mkdir $HOME/ijava
cd $HOME/ijava
wget -q https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip
unzip ijava-1.3.0.zip
python3 install.py --user
rm ijava-1.3.0.zip
cd $HOME
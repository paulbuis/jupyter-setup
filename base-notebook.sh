#! /bin/sh
#
# This is just a shell script version of
#
# https://github.com/jupyter/docker-stacks/blob/master/base-notebook/Dockerfile
#
# and does not include any parts that need to be run with root privledges like apt-get
# we are blindly assuming that all the needed Linux distro packages are already installed
# such as:
#   wget
#   bzip2
#   ca-certificates
#   sudo
#   locales
#   fonts-liberation
#   run-one
#

MINICONDA_VERSION=4.6.14
CONDA_VERSION=4.7.10
CONDA_DIR=$HOME/miniconda3

cd /tmp
wget --quiet https://repo.continuum.io/miniconda/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh
/bin/bash Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh -f -b -p $CONDA_DIR
rm Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh

echo "conda ${CONDA_VERSION}" >> $CONDA_DIR/conda-meta/pinned
PATH=$CONDA_DIR/bin:$PATH
# double check conda is found on $PATH at $HOME/miniconda3/bin
echo `which conda`
# always try to get conda packages from the conda-forge channel
conda config --system --prepend channels conda-forge
conda config --system --set auto_update_conda false
conda config --system --set show_channel_urls true
# miniconda's conda replaced by newer conda version pinned to CONDA_VERSION
conda install --quiet --yes conda
# now we update everything
conda update --all --quiet --yes
# now we pin python
conda list python | grep '^python ' | tr -s ' ' | cut -d '.' -f 1,2 | sed 's/$/.*/' >> $CONDA_DIR/conda-meta/pinned
# install the juptyer project servers
conda install --quiet --yes 'notebook=6.0.0' 'jupyterhub=1.0.0' 'jupyterlab=1.0.4'
# double check that npm is found on $PATH at $HOME/miniconda3/bin
echo `which npm`
# this should be first time conda's npm has run, so should be nothing in cache
# but we make sure by doing a forced clean
# npm may say it "hopes we know what we are doing"
npm cache clean --force
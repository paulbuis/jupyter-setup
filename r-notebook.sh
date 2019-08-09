#! /bin/bash
#
# must be run after base-notebook.sh
# may be run before or after scipy-notebook.sh
#
# This is just a shell script version of
# https://github.com/jupyter/docker-stacks/blob/master/r-notebook/Dockerfile
#
# We are blindly assuming the needed Linux distro packages are already installed, such as:
#   fonts-dejavu
#   unixodbc
#   unixodbc-dev
#   r-cran-rodbc
#   gfortran
#   gcc

MINICONDA_VERSION=4.6.14
CONDA_VERSION=4.7.10
CONDA_DIR=$HOME/miniconda3
PATH=$CONDA_DIR/bin:$PATH

#verify that conda is found in $HOME/miniconda3/bin
echo `which conda`
conda install --quiet --yes \
    'r-base=3.6.1' \
    'r-rodbc=1.3*' \
    'unixodbc=2.3.*' \
    'r-irkernel=1.0*' \
    'r-plyr=1.8*' \
    'r-devtools=2.0*' \
    'r-tidyverse=1.2*' \
    'r-shiny=1.3*' \
    'r-rmarkdown=1.14*' \
    'r-forecast=8.7*' \
    'r-rsqlite=2.1*' \
    'r-reshape2=1.4*' \
    'r-nycflights13=1.0*' \
    'r-caret=6.0*' \
    'r-rcurl=1.95*' \
    'r-crayon=1.3*' \
    'r-randomforest=4.6*' \
    'r-htmltools=0.3*' \
    'r-sparklyr=1.0*' \
    'r-htmlwidgets=1.3*' \
    'r-hexbin=1.27*'
# not really sure why this is done as a separate
# run of conda, just mimicking Dockerfile
conda install --quiet --yes r-e1071
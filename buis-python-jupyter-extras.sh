#! /bin/bash

# must run after scipy-notebook.sh
#
# This is just a shell script version of
# https://github.com/jupyter/docker-stacks/blob/master/scipy-notebook/Dockerfile
#
# these environment variables should be same as ones in base-notebook.sh
MINICONDA_VERSION=4.6.14
CONDA_VERSION=4.7.10
CONDA_DIR=$HOME/miniconda3
PATH=$CONDA_DIR/bin:$PATH

#verify that conda is found in $HOME/miniconda3/bin
echo `which conda`
conda install --quiet --yes \
    'autopep8=1.4.4' \
    'yapf=0.27.0' \
    'rise=5.5.1' \
    'pygraphviz=1.5' \
    'nodejs=11.14.*' \
    'pyyaml=5.1.1' \
    'jupyter_contrib_nbextensions=0.5.1' \
    'jupyter_nbextensions_configurator=0.4.1' \
    'ipyleaflet=0.10.2' \
    'beakerx=1.4.*'

# still not sure if these should use --sys-prefix in this config since CONDA_DIR is not /opt/conda
jupyter nbextension enable --py widgetsnbextension --sys-prefix
jupyter nbextension enable rise/main --sys-prefix
jupyter labextension install @jupyter-widgets/jupyterlab-manager@^1.0.0
jupyter labextension install jupyterlab_bokeh@1.0.0
jupyter labextension install beakerx-jupyterlab
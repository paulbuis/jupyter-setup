#! /bin/bash
# run base-notebook.sh as first stage
# may run this script before or after r-notebook.sh
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
    'conda-forge::blas=*=openblas' \
    'ipywidgets=7.5*' \
    'pandas=0.25*' \
    'numexpr=2.6*' \
    'matplotlib-base=3.1.*' \
    'scipy=1.3*' \
    'seaborn=0.9*' \
    'scikit-learn=0.21*' \
    'scikit-image=0.15*' \
    'sympy=1.4*' \
    'cython=0.29*' \
    'patsy=0.5*' \
    'statsmodels=0.10*' \
    'cloudpickle=1.2*' \
    'dill=0.3*' \
    'dask=2.2.*' \
    'numba=0.45*' \
    'bokeh=1.3*' \
    'sqlalchemy=1.3*' \
    'hdf5=1.10*' \
    'h5py=2.9*' \
    'vincent=0.4.*' \
    'beautifulsoup4=4.8.*' \
    'protobuf=3.9.*' \
    'xlrd'

# not sure --sys-prefix is right for this config, since CONDA_DIR isn't /opt/conda
jupyter nbextension enable --py widgetsnbextension --sys-prefix
jupyter labextension install @jupyter-widgets/jupyterlab-manager@^1.0.1 --no-build
jupyter labextension install jupyterlab_bokeh@1.0.0 --no-build 
jupyter lab build --dev-build=False

# remove any trace of previous installs
npm cache clean --force
rm -rf $CONDA_DIR/share/jupyter/lab/staging
rm -rf $HOME/.cache/yarn
rm -rf $HOME/.node-gyp

# Install facets which does not have a pip or conda package at the moment
cd /tmp
git clone https://github.com/PAIR-code/facets.git
# again, not sure if --sys-prefix makes sense with this config, since CONDA_DIR isn't /opt/conda
cd facets
jupyter nbextension install facets-dist/ --sys-prefix
cd $HOME
# remove direcory created by git when downloading facets repository
rm -rf /tmp/facets

# don't know what this is all about, it was in Dockerfile, but I don't understand what it does
#XDG_CACHE_HOME=$HOME/.cache/
#MPLBACKEND=Agg python -c "import matplotlib.pyplot"
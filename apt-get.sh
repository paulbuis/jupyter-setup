#! /bin/sh
#
# must be run as superuser to install Linux distro packages

apt-get update
apt-get -yq dist-upgrade
echo "update/upgrade complete"

# to support base-notebook:
apt-get install -yq --no-install-recommends \
    wget \
    bzip2 \
    ca-certificates \
    sudo \
    locales \
    fonts-liberation \
    run-one
echo "apt-get install for base-notebook complete"

#to support minimal-notebook
apt-get install -yq --no-install-recommends \
    build-essential \
    emacs \
    git \
    inkscape \
    jed \
    libsm6 \
    libxext-dev \
    libxrender1 \
    lmodern \
    netcat \
    pandoc \
    python-dev \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-xetex \
    tzdata \
    unzip \
    nano
echo "apt-get install for minimal-notebook complete"

#to support scipy-notebook
apt-get install -y --no-install-recommends ffmpeg
echo "apt-get install for scipy-notebook complete"

#to support r-notebook
apt-get install -y --no-install-recommends \
    fonts-dejavu \
    unixodbc \
    unixodbc-dev \
    r-cran-rodbc \
    gfortran \
    gcc
echo "apt-get install for r-notebook complete"

#to support buis-python-jupyter-extras
apt-get install -y --no-install-recommends \
	python-numpy \
	libicu-dev
echo "apt-get install for buis-python-jupyter-extras complete"

#to support buis-many
apt-get install -y --no-install-recommends \
	file \
	libunwind-dev
echo "apt-get install for buis-many complete"
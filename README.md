# jupyter-setup
Setup scripts to install Jupyter on Ubuntu (contains script that uses apt) Linux

### Ubuntu packages 
Prereqs for conda packages used by Jupyter can be installed by using the command:

```bash
sudo sh apt-get.sh
```

This is the only one of the scripts which require superuser privledges. The rest of them build a conda environment in
the $HOME/miniconda3 folder.

If you are using a Debian-based Linux distribution that is not also Ubuntu-based, you may only need to make minor changes to apt-get.sh.

However, if you are using a Linux distribution that is not in the Debian family and/or uses a different package manager, this will
need major changes.

TODO: provide a script that does not require superuser privledges and generates a list of missing Ubuntu packages. This will allow
users that don't have superuser privledges to make precise requests of their system administrator to add packages. An alternative
would be to set something up that fetched the source for the packages and built them in the user's home directory
somewhere and added that somewhere to the user's PATH. The primary target of this project, however, is users with superuser
privs on their own Ubutnu Linux (possibly virtual) machine.

### Base-notebook packages
To install Miniconda3 and conda packages to run the Juptyer Project's
[base-notebook](https://github.com/jupyter/docker-stacks/tree/master/base-notebook),
use  the command:

```bash
sh base-notebook.sh
```

Note: the script is intended to mirror what the Jupyter base-notebook Dockerfile does exactly. One could experiment with using
a newer version of the Miniconda3 install script. I don't *think* that would have any likely downside, but I also don't see
a serious upside.

### Minimal-notebook packages
Note that the Jupyter Docker image for [minimal-notebook](https://github.com/jupyter/docker-stacks/tree/master/minimal-notebook)
does not install any conda packages, so there is no script to do so. The minimal-notebook Dockerfile does is add Linux packages
via apt-get, which in this project we do in apt-get.sh.

### Scipy-notebook packages
To install conda packages to run the Juptyer Project's
[scipy-notebook](https://github.com/jupyter/docker-stacks/tree/master/scipy-notebook),
after running <code>minimal-notebook.sh</code> use the command:

```bash
sh scipy-notebook.sh
```

### R-notebook packages
To install conda packages to run the Juptyer Project's
[r-notebook](https://github.com/jupyter/docker-stacks/tree/master/r-notebook),
after running <code>minimal-notebook.sh</code> (running <code>r-notebook.sh</code>
is optional and needed only if you only intend to use R with Jupyter) use the command:

```bash
sh r-notebook.sh
```

### Buis Python Jupyter extras
To install conda packages to run Paul Buis'
[jupyter-beakerx](https://github.com/paulbuis/jupyter-beakerx),
after running <code>scipy-notebook.sh</code> use the command:

```bash
sh buis-python-jupyter-extras.sh
```

This will add:
* BeakerX
  * kernels for Java-based languages such as
    * Kotin
    * Groovy
    * Scala
* Jupyter_contrib_extensions
* Jupyter_nbextensions_configurator
* packages to suport the above extensions:
  * autopep8
  * yapf
  * rise
* Python packages Buis likes to use such as:
  * pygraphviz
  * pyyaml
  
 ### Buis many
To install conda packages to run Paul Buis'
[jupyter-many](https://github.com/paulbuis/jupyter-many),
after running <code>buis-python-jupyter-extras.sh</code> use the command:

```bash
sh buis-many.sh
```
This will add kernels for:
* C++ (zeus-cling)
* Javascript (ijavascript)
* Typescript (itypescript)
* Java (ijava)

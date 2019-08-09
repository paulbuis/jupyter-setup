# jupyter-setup
Setup scripts to install Jupyter on Ubuntu (contains script that uses apt) Linux

### Ubuntu packages 
Prereqs for conda packages used by Jupyter can be installed by using the command:

```bash
sudo sh apt-get.sh
```

### Base-notebook packages
To install Miniconda3 and conda packages to run the Juptyer Project's
[base-notebook](https://github.com/jupyter/docker-stacks/tree/master/base-notebook),
use  the command:

```bash
sh base-notebook.sh
```

### Minimal-notebook packages
To install conda packages to run the Juptyer Project's
[minimal-notebook](https://github.com/jupyter/docker-stacks/tree/master/minimal-notebook),
after running <code>base-notebook.sh</code> use the command:

```bash
sh minimal-notebook.sh
```

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
after running <code>minimal-notebook.sh</code> (running <code>scipy-notebook.sh</code>
is optional if you only intend to use R with Jupyter) use the command:

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

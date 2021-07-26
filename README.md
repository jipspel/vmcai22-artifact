# Artifact for submission TODO


This is an artifact created for our VMCAI submission: _Linus Heck, Jip Spel, Sebastian Junges, Joost-Pieter Katoen and Joshua Moerman._ **Gradient-Descent for Randomized Controllers under Partial Observability**

## What is inside
When installed, the artifact contains:
 * dependencies for Storm,
 * dependencies for Prophesy
 * Storm,
 * Prophesy,
 * folder with the Benchmarks, 
 * scripts to run the Benchmarks, and
 * paper.

The artifact contains the sources and users need to install all the relevant tools.

## How to install the artifact
Copy the artifact folder e.g. to 
```sh
~/home/vmcai22/Desktop
```
Go to the artifact folder e.g.
```sh
cd ~/home/vmcai22/Desktop/artifact
```
To install Storm and all dependencies run the following:
```sh
sudo ./install_dependencies.sh && sudo ./install_storm.sh
```

To install Prophesy and all dependencies run the following:
```sh
sudo ./install_dependencies.sh && sudo ./install_prophesy.sh
```

The first script installs all dependencies, the second script installs Storm. The scripts use automatically the maximum available cores (decreases time, increases peak memory consumption). We recommend allocating
**6GB RAM** for the VM if possible, and a decent amount of time for you.
Installing over night is not a bad idea at all.

## How to use the artifact
The best starting point is the README.md file in this folder. 

## Replicating results of Storm

### Running Storm

#### Running all Benchmarks
 
#### Running one benchmark with a script

##### Drn files.

##### Prism files

##### Output

#### Running one benchmark yourself

##### Output

##### Path to storm-pars
The executable storm-pars can be found in the build/bin folder in storm.

##### drn or prism
The extension of the model (.drn or .prism) tells you whether you need to use --explicit-drn or --prism.

##### Path to model
The model can be found in the model folder.

##### Path to property
The property can be found in the properties folder.

##### Options
All options are seperated by a space.


Other options
* -v sets the output to verbose.

Note that all possible options Storm provides can be found with the --help flag. 

## Replicating results of Prophesy

## Analyzing the results

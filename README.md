# Artifact for submission TODO


This is an artifact created for our VMCAI submission: _Linus Heck, Jip Spel, Sebastian Junges, Joost-Pieter Katoen and Joshua Moerman._ **Gradient-Descent for Randomized Controllers under Partial Observability**

## What is inside
The artifact contains:
 * Storm,
 * Stormpy,
 * Prophesy (to reproduce the results of QCQP/PSO),
 * folder with the Benchmarks, 
 * scripts to run the Benchmarks, 
 * scripts to create the plots, and
 * paper.

## VM Requirements
We recommend allocating at least **6GB RAM** for the VM if possible, and a decent amount of time for you.
In our experiments, we set a time-out of two hours and used machines with an Intel Xeon Platinum 8160 CPU and 32GB of RAM.

## How to use the artifact
The best starting point is the README.md file in this folder.  
See *Replicating results of Storm* to replicate the results for gradient-descent. 
See *Replicating results of QCQP/PSO* to replicate the results for the existing state-of-the-art feasibility methods.

## Replicating results of Storm
All Benchmarks are located in the Benchmarks folder. 
All Scripts are located in the Scripts folder.
The Storm folder contains the source-code of storm and the compiled binaries.


### Benchmarks
All benchmarks (model files and properties) are located in the Benchmarks folder.
The models are partially prism-files and partially drn-files.

### Running Storm

#### Running all benchmarks
All benchmarks can be run with the ./run_all.sh script. 
However, we suggest you to run either one benchmark, or a subset of the benchmarks as a large amount of resources is needed to reproduce our result.

#### Running one benchmark
The structure of the command looks as follows:
```sh
[path to storm-pars] --gradient-descent [--explicit-drn or --prism] [path to model] --prop [path to property] --core:eqsolver gmm++ --learning-rate [learning-rate] --descent-method [descent-method] --constraint-method [constraint-method]
```

##### Path to storm-pars
The executable storm-pars can be found in the build/bin folder in storm.

##### Model type (drn or prism)
The extension of the model (.drn or .prism) tells you whether you need to use --explicit-drn or --prism.

##### Path to model/property
The model and property can be found in the Benchmarks folder.

##### Equation solver
We set the equation solver to gmm++, other options are:
**TODO**

##### Learning-rate
The learning-rate can be set to any strict-positive value smaller than one.
Experiments show that 0.1 is the most suited learning-rate for our benchmarks.

##### Descent-method
The descent-method can be set to one of the following:
* adam
* radam
* rmsprop
* plain 
* plain-sign
* momentum
* momentum-sign
* nesterov
* nesterov-sign

Where the first three are adaptive gradient-descent method, and the others classical ones.

##### Constraint-method
The constraint method (region restricition method) can be set to one of the following:
* barrier-logarithmic
* project
* project-gradient
* logistic-sigmoid


##### Other options
Note that all possible options Storm provides can be found with the --help flag.

Other helpfull options
* -v sets the output to verbose.


#### Running a subset of the benchmarks
As a large amount of resources is needed to reproduce our result, we suggest you to use the subset script and run this over-night.


##### Output


## Replicating results of QCQP/PSO


## Analyzing the results

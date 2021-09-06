# Artifact for submission 12


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
We recommend allocating at least **8GB RAM** for the VM if possible, and a decent amount of time for you.
In our experiments, we set a time-out of two hours and used machines with an Intel Xeon Platinum 8160 CPU and 32GB of RAM.

## How to use the artifact
The best starting point is the README.md file in this folder. 

## Replicating results
Before you can replicate the results, you should activate the python environment. To do so, use the terminal to go to the tools folder on the Desktop.
```sh
cd ~/Desktop/Tools
```
Now activate the environment
```sh
source env/bin/activate
```
Next go to the Benchmarks folder and follow one of the next sections.
```sh
cd ~/Desktop/Benchmarks
```

### Replicating results of all benchmarks/one benchmark
#### Creating benchmarks
One can generate benchmarks with the `generate_commands` script. The benchmarks are in
`testcases-paper`, or `testcases-paper-twentypercent` and need to be
passed to `--folder`. For example:
```sh
python3 generate_commands.py --folder testcases-paper
```
This will generate DTMCs from the POMDP files using `storm-pomdp`. You can look inside these
folders, they are made of models and JSON configs for the benchmarks and should be relatively
readable. 
All test-cases are written to the `./build/testcases-paper`, or `./build/testcases-paper-twentypercent` folder.
#### Creating test scenarios
To invoke the test scenarios from the paper, you need to use `global-override` with the
supplied json files. Furthermore, you can set the timeout (default is 1800s) with `--timeout`
```sh
python3 generate_commands.py --folder testcases-paper --global-override all_gd_methods.json --timeout 100
```
Invoking this script creates a `commands_all.sh` file.
To run all commands: run the entire manual command file. **This is not recommended, as it will take a lot of time**
To run one command: pick your favorite command from the manual command file.

### Replicating subset of results.
This part describes how to generate the benchmarks for a subset of the benchmarks.
For all subsets, we consider a learning rate of 0.1. 
Furthermore, we consider the following benchmarks: 4x4 grid-avoid, maze2, n2\_ps\_sent, sample_rocks.
##### Figure 5
The following GD methods are considered: Adam, Momentum-Sign.
All region restriction methods are considered.
##### Figure 6
All GD methods are considered.
The following region restriction method is considered: projection.
##### Figure 7
The following GD methods is considered: Momentum-Sign.
The following regeion restriction method is considered: projection.
For the twenty-percent bound, please use `testcases-paper-twentypercent`.

#### Creating benchmarks
One can generate benchmarks with the `generate_[fig5/fig6/fig7]_subset_commands.py` script. The benchmarks are in
`testcases-paper` or `testcases-paper-twenteypercent` and need to be passed to `--folder`. For example:
```sh
python3 generate_fig5_subset_commands.py --folder testcases-paper
```
This will generate DTMCs from the POMDP files using `storm-pomdp`. You can look inside these
folders, they are made of models and JSON configs for the benchmarks and should be relatively
readable. 
All test-cases are written to the `.build/[fig5/fig6/fig7]-testcases-paper` folder.
#### Creating test scenarios
To invoke the test scenarios from the paper, you need to use `global-override` with the
supplied json files. Furthermore, you can set the timeout (default is 1800s) with `--timeout`
```sh
python3 generate_fig5_subset_commands.py --folder testcases-paper --global-override gd_methods_fig5.json
```
Invoking this script creates a `commands_subset_fig5.sh` file.
You could either run the entire manual command file or pick a subset of the commands.

### Command structure gradient descent
The structure of the command looks as follows:
```sh
[path to storm-pars] --gradient-descent [--explicit-drn or --prism] [path to model] --prop [path to property] --core:eqsolver gmm++ --learning-rate [learning-rate] --descent-method [descent-method] --constraint-method [constraint-method]
```

##### Path to storm-pars
The executable storm-pars can be found in the `~Desktop/Tools/storm/build/bin` folder in storm.

##### Model type (drn or prism)
The extension of the model (.drn or .prism) tells you whether you need to use `--explicit-drn` or `--prism`.

##### Path to model/property
The model and property can be found in the `~Desktop/Tools/Benchmarks/.build/*` folder.

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
* project-gradient
* logistic-sigmoid


##### Other options
Note that all possible options Storm provides can be found with the --help flag.

#### Command structure QCQP
```sh
python [path to prophesy]/scripts/parameter_synthesis.py load-problem [path to model] [path to property] set-threshold [threshold for property] find-feasible-instantiation --qcqp-handle-violation minimisation --qcqp-mc full --precheck-welldefinedness above qcqp 
```
#### Command structure PSO
```sh
python [path to prophesy]/scripts/parameter_synthesis.py load-problem [path to model] [path to property] set-threshold [threshold for property] find-feasible-instantiation --qcqp-handle-violation minimisation --qcqp-mc full --precheck-welldefinedness above pso
```


### Analyzing results
Now, you probably have some ouput files. From this, you can generate a CSV file that contains the
performance statistics using `process_output.py`. Just put the outputs into the arguments:
```sh
python3 process_output.py *.out
```
This will create an `out_*.csv*` file. The data csvs from the paper are in the `vmcai-paper-bench/` folder.
From this, you can generate scatter plots using `csv_to_scatter.py`. E.g. for figure 5a use:
```sh
python csv_to_scatter.py vmcai-paper-bench/method_comparison.csv "momentum-sign" "momentum" "Momentum-Sign" "Momentum" --comp-field "Method" --filter "Add. Settings:Project with gradient" --output-pdf vmcai-paper-bench/pdfs/momentum-sign-vs-momentum.pdf --seperate-legend True
```
Look into `vmcai-paper-bench/paper_plots.sh` for the commands that are used to generate the plots from the
paper.
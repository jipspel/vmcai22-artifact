# Artifact for submission 136


This is an artifact created for our TACAS submission: _Jip Spel, Sebastian Junges and Joost-Pieter Katoen._ **Finding Provably Optimal Markov Chains.**

## What is inside
When installed, the artifact contains:
 * dependencies for Storm,
 * Storm,
 * folder with the Benchmarks, 
 * updated version of paper, and
 * letter to the reviewers.

The artifact contains the sources and users need to install all the relevant tools.

## How to install the artifact
Copy the artifact folder e.g. to 
```sh
~/home/tacas21/Desktop
```
Go to the artifact folder e.g.
```sh
cd ~/home/tacas21/Desktop/artifact
```
To install Storm and all dependencies run the following:
```sh
sudo ./install_dependencies.sh && sudo ./install_storm.sh
```

The first script installs all dependencies, the second script installs Storm. The scripts use automatically the maximum available cores (decreases time, increases peak memory consumption). We recommend allocating
**6GB RAM** for the VM if possible, and a decent amount of time for you.
Installing over night is not a bad idea at all.

## How to use the artifact
The best starting point is the README.md file in this folder. Furthermore, the letter to the reviewers (letter.pdf) is usefull when replicating the results. 

## Replicating evaluation of Storm

### Running Storm
Go to the Benchmarks folder.
```sh
cd Benchmarks
```
The Benchmarks folder contains all model files and properties. Furthermore, it contains scripts to run the benchmarks.

#### Running all Benchmarks
 Use the script run_all.sh to run all cases vanilla and integrated with both epsilons 0.1 and 0.05
 ```sh
 ./run_all.sh
 ```
 To run all benchmarks for the integrated case with an epsilon of 0.1:
 ```sh
 ./run_all_integrated_0.1.sh
 ```
 
 **Using the run_all script may take a significant time, therefore, we suggest to use the script for one benchmark.** 
 
#### Running one benchmark with a script
##### Drn files.
The files for the benchmarks for nrp, evade and maze are .drn files. To run one instance of this use the script run_one.sh. As argument provide the type you want to run [vanilla or integrated] and the epsilon [0.1 or 0.05].
```sh
./run_one.sh [nrp, evade, or maze ] [instance of the benchmark] [vanilla or integrated] [0.1 or 0.05]
```
To run nrp for the integrated case with an epsilon of 0.1:
```sh
./run_one.sh nrp 10,1 integrated 0.1
```

##### Prism files
The files for the benchmarks of herman are .prism files. To run one instance of this use the script run_herman.sh. As argument provide the type you want to run [vanilla or integrated] and the epsilon [0.1 or 0.05].
```sh
./run_herman.sh [instance of the benchmark] [vanilla or integrated] [0.1 or 0.05]
```
To run herman for the integrated case with an epsilon of 0.1:
```sh
./run_herman.sh 11,15 integrated 0.1
```
##### Output
The output of the run is written to the output folder. The name of the file is
```sh
output_[benchmark]_[instance of the benchmark]_[vanilla or integrated]_[0.1 or 0.05].txt
```
E.g.
```sh
output_nrp_10,1_integrated_0.1.txt
```
#### Running one benchmark yourself
It is also possible to provide the whole command yourself.
The structure of the command looks as follows:
```sh
[path to storm-pars] [--explicit-drn or --prism] [path to model] --prop [path to property] [options]
```
To run nrp for the integrated case with an epsilon of 0.1:
```sh
../storm/build/bin/storm-pars --explicit-drn ./models/nrp_10,1.drn --prop ./properties/property_nrp.prctl --regionbound 0.1 --bisimulation --use-monotonicity --mon-bounds --splitting-threshold 1 --extremum max 0.1
```
To run the Herman protocol for the integrated case with an epsilon of 0.1
```sh
../storm/build/bin/storm-pars --prism ./models/herman_11,15.drn --prop ./properties/property_herman.prctl --regionbound 0.1 --bisimulation --use-monotonicity --mon-bounds --splitting-threshold 1 --extremum max 0.1
```

##### Output
In this case the output is written directly to the commandline. Ofcourse, it could be written to a file e.g. by adding "> output/output.txt". 

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

The options used for all benchmarks are:
* --regionbound 0.1 which sets all parameters to the range [0.1, 0.9]
* --bisimulation which makes sure we use bisimulation before analyzing the model
* --splitting-threshold [value] tells in how many parameters the region is split in in one iteration. In our case we choose 1.

The additional options used for the integrated functionality are as follows:
* --extremum max [epsilon] to obtain the maximal value, with a precision of epsilon 
* --use-monotonicity to make sure monotonicity is used
* --mon-bounds if set bounds obtained by parameter lifting are used.

Other options
* -v sets the output to verbose.

Note that all possible options Storm provides can be found with the --help flag. 

### Analyzing the results
When using the scripts, the output is written to the output folder.
To make it more easy to interpret the output, we provide a script to transform the output to a .csv file
#### Getting results of ./run_all.sh script in csv file.
```sh
./get_csv_all.sh
```
Now the following files are created in the Benchmarks folder:
* vanilla_0.1.csv
* vanilla_0.05.csv
* integrated_0.1.csv
* integrated_0.05.csv

**Note that running this overwrites the exisisting .csv files**

#### Writing seperate result to .csv file.
To get the csv result for one case use:
```sh
./get_csv_[vanilla or integrated].sh [output_name] [csv_name]
```
E.g.
```sh
./get_csv_integrated.sh output_nrp_10,1_integrated_0.1.txt integrated_nrp.csv
```

It extends the [csv_name] file with one new entry for this case.
The header of the table is not printed by this script. This could be fixed manually.
E.g.
```sh
cat output_header_integrated.txt >> integrated_nrp.csv 
```

Note that the machine we used for the evaluation differs from the VM of the artifact. As a result, running the examples in the artifact may require less splits than our reported results.

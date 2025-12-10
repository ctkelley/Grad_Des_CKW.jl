# Grad_Des_CKW.jl

This repo has the codes for the examples in

__Complexity of Projected Gradient Methods for Strongly Convex  Optimization with H{\"o}lder Continuous Gradient Terms__

by X. Chen, C. T. Kelley, and L. Wang

__You must run the notebook to view the examples.__

 ## Prerequisites
You must know enough Julia to 
- install packages and use Pkg,
- run an IJulia notebook,
- and manage Github.

## Dependencies ##

__Use the latest version of Julia (1.12) with these codes.__

You'll need to have these packages and their dependencies.
- LaTeXStrings
- Printf
- PyPlot
- SIAMFANLEquations

## Running the notebook ##
- Clone this repository
- Put the directory in your Julia LOAD_PATH
- cd to the directory; start Julia, and then type
   ```notebook(;dir=pwd())``` in the REPL
- a web page of the directory will open. Click on the notebook __Examples.ipynb__
- When the notebook opens, do a ```run all```
- If you get error messages about the kernel. To ```build IJulia``` from the package manager.
  
## What's in this repo? ##
- The codes for generating the figures in the paper are in __/src/Figures__.
- Algorithms 1, 2, and 3 are in __/src/Algorithms__
- The funcitons for the exact solution from Example 1 are in __/src/Analytic_Solution__.
- I am still figuring out the data structures for the two examples. __/src/Problem_Data__ ia start.
- __/src/Tools__ are some untilities I use to make the plots.
- Examples.pdf is a pdf copy of the notebook.

## Caveat ##

__Warning:__ The work is incomplete and the codes in the __Old_Julia__ directory are poorly documented and do not use the formulation or the algorithms from the paper.

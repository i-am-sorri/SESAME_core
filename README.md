# SESAME_core


This is a MATLAB implementation of the Bayesian multi--dipole modeling method and Sequential Monte Carlo algorithm described in 

Sommariva and Sorrentino (2014) Inverse Problems

and currently implemented in BESA Research 7.0.

The algorithm takes in input a sourcespace, a leadfield and a data time series, and outputs a posterior probability map for source locations, the estimated number of dipoles, their locations and their amplitudes.

script_run_SESAME.m contains an example script that launches the algorithm.
inverse_SESAME.m contains the Monte Carlo algorithm.
inverse_SESAME_viewer.m contains code for visualizing the output.

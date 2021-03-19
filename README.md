Install ARGoS from: www.argos-sim.info

To run one experiment:
1) Go to one of the folders in  code/experiments-collision_avoidance-3RBN_bias-nosl-xor/ (BNs with 100 nodes or 1000 nodes)
2) In case adjust the parameters in bn_robot-collision_avoidance-example.lua, e.g. the bias
3) Run the experiment: argos3 -c run-collision_avoidance-example.argos &
4) The simulation ends when you stop it from the simulator interface


To run all the experiments in batch, go to folder "code" and execute the script run_experiments.sh


In the same folder the code for producing the trajectories is provided, along with a howto.


The folder results contains the raw results and the R scripts to produce the boxplots, the run-length distributions and the individual evaluation function trand in the runs.
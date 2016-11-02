clear
clc

input = [303 202];
weight_in = [0.89 0.1; 1 3];
weight_1 = [0.1 0.6; 1 5];
weight_out = [0.1 0.1; 0.1 0.1];
Weights = cell(1,3);
Weights{1,1} = weight_in;
Weights{1,2} = weight_1;
Weights{1,3} = weight_out;
out = neural_net_function(Weights, input)
fitness_value = sort(feval('fgeneric', transpose([0.005 0.0005])))
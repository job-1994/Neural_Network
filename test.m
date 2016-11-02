clear
clc

input = [0.5 0.1];
weight_in = [0.1 0.2; -1 2];
weight_1 = [-0.1 0.2; 1 -2];
weight_out = [-0.5 1.5; 0.5 -3.7];
Weights = cell(1,3);
Weights{1,1} = weight_in;
Weights{1,2} = weight_1;
Weights{1,3} = weight_out;

neural_out = neural_net_function(Weights, input)

fitness_value = feval('fgeneric', transpose(neural_out))


clc
clear
N = 2;
dimensions = 2;
nHiddenLayers = 3;
neurons = 2;
input = [2 2];
test = populate(N, dimensions, nHiddenLayers, neurons)
tested = encode(test, nHiddenLayers, neurons, dimensions)
weight = {tested{1, 1} tested{1, 2} tested{1, 3}};

neural_net = neural_net_function(input, weight, nHiddenLayers);
display(test);


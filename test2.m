clc
clear
N = 2;
dimensions = 2;
nHiddenLayers = 2;
neurons = 2;
input = -5 + (5 + 5)*rand(dimensions,1);
test = populate(N, dimensions, nHiddenLayers, neurons);
tested = encode(test, nHiddenLayers, neurons, dimensions);
weight = {tested{1, 1} tested{1, 2} tested{1, 3} tested{1, 4}};

a = 1;
b = 2;
    
input = transpose(input);
input_weight_layer = weight{1};
layer_output = a*tanh(b*input * input_weight_layer);
    
for layer = 1: nHiddenLayers
    weight_layer = transpose(weight{2}{layer});
    layer_output = a*tanh(b*layer_output * weight_layer);
end

output_weight_layer = transpose(weight{3});
layer_output = a*tanh(b*layer_output * output_weight_layer);
% Output = weight{4}*(layer_output)
Output = 100*(layer_output)




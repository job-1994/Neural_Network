%This function provides the Neural Network Calculations, it takes in the
%matrix of inputs (size depends on dimensions), the weights for the neural
%network organized by encode(), and the amount of hidden layers.

%Activation function per layer is a*tanh(b*previous_layer_output), the last
%layers output is multiplied by a final weight that determines the
%magnitude of the output value, as this differs per function.
function Output = neural_net_function(input, Weights, nHiddenLayers)
a = 1;
b = 2;

%Input layer
input = transpose(input);
input_weight_layer = Weights{1};
layer_output = a*atan(b*input * input_weight_layer);

%Cycles through hidden layers, as defined in the passed in parameters
for layer = 1: nHiddenLayers
    weight_layer = transpose(Weights{2}{layer});
    layer_output = a*atan(b*layer_output * weight_layer);
end

%Output layer, lastly multiplied by weight containing the order of
%magnitude
output_weight_layer = transpose(Weights{3});
layer_output = a*atan(b*layer_output * output_weight_layer);
Output = Weights{4}*(layer_output);

end
function Output = neural_net_function(input, Weights, nHiddenLayers)
%Activation function per layer is a*tanh(b*previous_layer_output), the last
%layers output is multiplied by a final weight that determines the
%magnitude of the output value, as this differs per function.
    a = 2;
    b = 1;
    
    %Input layer
    input = transpose(input);
    input_weight_layer = Weights{1};
    layer_output = tanh(input * input_weight_layer);
    
    %Cycles through hidden layers, as defined in the passed in parameters
    for layer = 1: nHiddenLayers
        weight_layer = transpose(Weights{2}{layer});
        layer_output = b*tanh(a*layer_output * weight_layer);
    end
    
    %Output layer, lastly multiplied by weight containing order of
    %magnitude
    output_weight_layer = transpose(Weights{3});
    layer_output = b*tanh(a*layer_output * output_weight_layer);
    Output = Weights{4}*(layer_output);

end
function Output = neural_net_function(Weights, input)
    
    weight_input_layer = transpose(Weights{1,1});
    weight_1st_layer = transpose(Weights{1,2});
    weight_output_layer = transpose(Weights{1,3});
    
    layer_1_output = ((sqrt(input * weight_input_layer).^2 + 1) -1)/2 + input * weight_input_layer;
    layer_2_output = ((sqrt(layer_1_output * weight_1st_layer).^2 + 1) -1)/2 + layer_1_output * weight_1st_layer;
    Output = ((sqrt(layer_2_output * weight_output_layer).^2 + 1) -1)/2 + layer_2_output * weight_output_layer;
    
    %layer_1_output = (1 + exp(-(input * weight_input_layer))).^(-1);
    %layer_2_output = (1 + exp(-(layer_1_output * weight_1st_layer))).^(-1);
    %Output = (1 + exp(-(layer_2_output * weight_output_layer))).^(-1);
    
    %layer_1_output = exp(-(input * weight_input_layer).^2);
    %layer_2_output = exp(-(layer_1_output * weight_1st_layer).^2);
    %Output = exp(-(layer_2_output * weight_output_layer).^2);
    
    %layer_1_output = tanh(input * weight_input_layer);
    %layer_2_output = tanh(layer_1_output * weight_1st_layer);
    %Output = tanh(layer_2_output * weight_output_layer);
    
end
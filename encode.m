function p = encode(weights, nLayers, neurons)
    chromosome_length = size(weights,2);
    input_length = chromosome_length - 6;
    popsize = size(weights,1);
    p = cell(popsize, 3);
    
    layer_input = zeros(2,input_length/2);
    layer_1 = zeros(2,2);
    layer_last = zeros(1,neurons);
    
    for i = 1:popsize
        for j = 1:(input_length/2)
            layer_input(1, j) = weights(i, j);
            layer_input(2, j) = weights(i, (input_length/2) + j);
        end
        
        layer_1(1,1) = weights(i, input_length + 1);
        layer_1(1,2) = weights(i, input_length + 2);

        layer_1(2,1) = weights(i, input_length + 3);
        layer_1(2,2) = weights(i, input_length + 4);
        
        for i = last_layer_weights:(last_layer_weights + neurons)
            x(n,i) = P(n,i
        end
        layer_2(1,1) = weights(i, input_length + 5);
        layer_2(1,2) = weights(i, input_length + 6);
        
        p{i,1} = layer_input;
        p{i,2} = layer_1;
        p{i,3} = layer_2;
    end
end
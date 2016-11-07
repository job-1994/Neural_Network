function p = encode(weights, nHiddenLayers, neurons, dimensions)
    chromosome_length = size(weights,2);
    input_length = neurons*dimensions;
    output_length = neurons;
    hidden_length = nHiddenLayers*(neurons^2);
    popsize = size(weights,1);
    p = cell(popsize,  4);
    for idx = 1 : popsize
        input_values = weights(idx,1:input_length);
        input_matrix = zeros(dimensions, neurons);
        for g = 1 : dimensions
            for h = 1 : neurons
                input_matrix(g,h) = input_values(h + ((g-1)*neurons));
            end
        end
        
        hidden_values = weights(idx,input_length + 1:hidden_length + input_length);
        output_matrix = weights(idx, input_length + hidden_length + 1:chromosome_length-1);
        output_bias = weights(idx, chromosome_length);
    
        individual_layer = cell(1,nHiddenLayers);
        individual_matrix = zeros(neurons, neurons);
        hidden_matrices = cell(1,nHiddenLayers);
     
        for k = 1:nHiddenLayers
            individual_layer{1,k} = hidden_values(1+((k-1)*(neurons^2)):k*(neurons^2));
        end
    
        for f = 1:nHiddenLayers
            for k = 1:neurons
                for l = 1:neurons
                    individual_matrix(k,l) = individual_layer{1,f}(l+((k-1)*neurons));
                end
            end
            hidden_matrices{1,f} = individual_matrix;
        end
        p{idx,1} = input_matrix;
        p{idx,2} = hidden_matrices;
        p{idx,3} = output_matrix;
        p{idx,4} = output_bias;
    end
end
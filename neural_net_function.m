%   Calculates the output of the neural network given a set of weights, "I"
%   and a set of input values, "input"

function x = neural_net_function(I, input)
    
    layers = 4;
    
    % Generate container cells to store neuronal calculations
    neuron = cell(1, layers);
    
    for i = 1:layers
        if i == 1
            neuron{1, i} = tanh(I{1, i}*input);
        else
            neuron{1, i} = tanh(I{1, i}*neuron{1, i-1});            
            if i == layers
                x = neuron{1, i};
            end            
        end
    end
end
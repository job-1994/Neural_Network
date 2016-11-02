clc
clear

in = [0.1 -1];
for iter=1:10
    weights = populate(4,2);
    encoded_weights = encode(weights);
    neural_out = neural_net_function(encoded_weights, in);
    fitness_value = feval('fgeneric', transpose(neural_out))
end


clc
clear

  in = -5 + (10+10)*rand(1,3)
    weights = populate(4,3);
    encoded_weights = encode(weights, 3);
    neural_out = neural_net_function(encoded_weights, in);
    %fitness_value = feval('fgeneric', transpose(neural_out))

%The evaluate generation function uses the test data from the COCO function
%and applies the populations chromosome weights to the neural network,
%generating values to compare to the desired output. The fitness is
%calculated per i/o pair and summed, then returned in an array with the
%same index as the original chromosome.

function fit= evaluate_generation(pop_size, weights, n_pairs, io_pairs, nHiddenLayers)

%Create matrix of zeros, the size of the population to retain proper
%index's
fit = zeros(1, pop_size);

%Cycle through population, obtain the weights,
for i = 1: pop_size
    weight = {weights{i, 1} weights{i, 2} weights{i, 3} weights{i, 4}};
    desired_value = zeros(1, n_pairs);
    nn_value = zeros(1, n_pairs);
    desired_value(1,:) = io_pairs{2}(1, :);
    for j = 1 : n_pairs
        input =  io_pairs {1}{j};
        nn_value(1,j) = neural_net_function(input, weight, nHiddenLayers);
    end
    fit(1, i) = fitness(desired_value, nn_value);
end
end
% Generate a population given the desired number of individuals, N, and the
% dimensions of the neural network, dimensions
function p = populate(N, dimensions, nLayers, neurons)
    genes = (dimensions*neurons) + nLayers*neurons.^2 + neurons;
    r1 = -1 + (1+1)*rand(genes,N);
    p = transpose(r1);
end
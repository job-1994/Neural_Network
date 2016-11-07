% Generate a population given the desired number of individuals, N, and the
% dimensions of the neural network, dimensions
function p = populate(N, dimensions, nLayers, neurons)
    genes = (2*dimensions) + nLayers*neurons.^2 + neurons;
    r1 = -5 + (5+5)*rand(genes,N);
    p = transpose(r1);
end
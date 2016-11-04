% Generate a population given the desired number of individuals, N, and the
% dimensions of the neural network, dimensions
function p = populate(N, dimensions)
    genes = (2*dimensions) + 6;
    r1 = -5 + (5+5)*rand(genes,N);
    p = transpose(r1);
end
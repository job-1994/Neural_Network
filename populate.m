% Generate a population given the desired number of individuals, N, and the
% dimensions of the neural network, dimensions
function p = populate(N, dimensions, nLayers, neurons)
    genes = (dimensions*neurons) + nLayers*neurons.^2 + neurons + 1;
    p = -1 + (1+1)*rand(N, genes);
    q = [1 1e1 1e2 1e3 1e4 1e5 1e6 1e7 1e8 1e9 1e10 -1 -1e1 -1e2 -1e3 -1e4 -1e5 -1e6 -1e7 -1e8 -1e9 -1e10];
    p1 = zeros(N,1);
    for d = 1 : N
        random_index =randi([1 size(q,2)]);
        p1(d,1) = q(random_index);
    end
    p(:, genes) = p1;
end
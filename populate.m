% Generate a population given the desired number of individuals, pop_size, and the
% dimensions of the neural network, dimensions
function p = populate(pop_size, dimensions, nLayers, neurons)
    genes = (dimensions*neurons) + nLayers*neurons.^2 + neurons + 1;
    p = -1 + (1+1)*rand(pop_size, genes);
    q = [1 1e1 1e2 1e3 1e4 1e5 1e6 1e7 1e8 1e9 1e10 -1 -1e1 -1e2 -1e3 -1e4 -1e5 -1e6 -1e7 -1e8 -1e9 -1e10];
    p1 = zeros(pop_size,1);
    for d = 1 : pop_size
        random_index =randi([1 size(q,2)]);
        p1(d,1) = q(random_index);
    end
    p(:, genes) = p1;
end
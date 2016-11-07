function f_array = evaluate_generation(pop_size, weights, n_pairs, io_pairs, nHiddenLayers)

f_array = zeros(1, pop_size);
for i = 1: pop_size
    weight = {weights{i, 1} weights{i, 2} weights{i, 3} weights{i, 4}};
    f_total = 0;
    for j = 1 : n_pairs
       input =  io_pairs {1}{j};
       f_desired = io_pairs{2}(1, j);
       f_nn = neural_net_function(input, weight, nHiddenLayers);
       f_total = f_total + fitness(f_desired, f_nn);
    end
    f_array(1, i) = f_total/n_pairs;
end 
end
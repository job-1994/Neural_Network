function weights_best = GA(io_pairs, n_pairs, DIM)

pop_size = 10;
lim_generations = 10;

pop = populate(pop_size, DIM);
weights = encode(pop);

for i = 1: pop_size
    weight = weights{i};
    f_total = 0;
    for j = 1 : n_pairs
       input =  io_pairs {j,1};
       f_desired = io_pairs {j,2};
       f_nn = neural_net_function(input, weight);
       f_total = f_total + fitness(f_desired, f_nn);
    end
end 







end
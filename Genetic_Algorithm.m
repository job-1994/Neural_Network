function weights_best = GA(io_pairs, n_pairs, DIM)

pop_size = 10;
lim_generations = 10;

%first generation
pop = populate(pop_size, DIM);
weights = encode(pop);

f_array = evaluate_generation(pop_size, weights, n_pairs, io_pairs);

%tournament selection

%produce next generation







end
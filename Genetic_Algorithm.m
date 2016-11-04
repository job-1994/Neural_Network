function weights_best = GA(io_pairs, n_pairs, DIM)

pop_size = 10;
lim_generations = 10;
k_parents = 5;

%create first generation
pop = populate(pop_size, DIM);
weights = encode(pop);

generation_fitness = evaluate_generation(pop_size, weights, n_pairs, io_pairs);

%tournament selection for mutation/crossover
next_generation = tournament(generation_fitness, pop, k_parents, pop_size);
%produce next generation







end
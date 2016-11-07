function weights_best = GA(io_pairs, n_pairs, DIM)

popsize = 200;
lim_generations = 500;
k_parents = 5;
mutate_rate = 0.1;

%create initial generation
pop = populate(popsize, DIM);
weights = encode(pop);

generation_fitness = evaluate_generation(popsize, weights, n_pairs, io_pairs, nLayers);

%produce next generation through tournament selection using crossover
next_generation = tournament(generation_fitness, pop, k_parents, popsize);
next_generation = mutate(next_generation, mutate_rate);

for generations = 1 : lim_generations
    weights = encode(next_generation);
    generation_fitness = evaluate_generation(popsize, weights, n_pairs, io_pairs, nLayers);
    next_generation = tournament(generation_fitness, pop, k_parents, popsize);
    next_generation = mutate(next_generation, mutate_rate);
    display(generations);
end

fbest = inf;
final_generation = next_generation;
final_generation_fitness = evaluate_generation(popsize, weights, n_pairs, io_pairs, nLayers);
for i = 1 : popsize
    if(final_generation_fitness(1,i) < fbest)
       fbest =  final_generation_fitness(1,i);
    end
end

idx = find(final_generation_fitness == fbest);

    weights = encode(final_generation);
    
    weight = {weights{idx, 1} weights{idx, 2} weights{idx, 3}};
    error = zeros(1,n_pairs);
    for j = 1 : n_pairs
       input =  io_pairs {1}{j};
       f_desired(1,j) = io_pairs{2}(1, j);
       f_nn(1,j) = neural_net_function(input, weight);
       error(1,j) = f_desired(1,j) - f_nn(1,j);
    end

end
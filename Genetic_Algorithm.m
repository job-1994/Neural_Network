function weights_best = GA(io_pairs, n_pairs, DIM)

popsize = 2;
lim_generations = 100;
k_parents = 5;
mutate_rate = 1/popsize;
nHiddenLayers = 3;
nNeurons = 2; 
%encode(weights, nHiddenLayers, neurons, dimensions)
%create initial generation
pop = populate(popsize, DIM, nHiddenLayers, nNeurons);
weights = encode(pop, nHiddenLayers, nNeurons, DIM);

generation_fitness = evaluate_generation(popsize, weights, n_pairs, io_pairs, nHiddenLayers);

%produce next generation through tournament selection using crossover
next_generation = tournament(generation_fitness, pop, k_parents, popsize);
next_generation = mutate(next_generation, mutate_rate);

best_generation = 0;
fbest = inf;
a = animatedline;
clearpoints(a);
title('Best Fitness per Generations');
xlabel('Generations');
ylabel('f best');  

for generations = 1 : lim_generations
    weights = encode(next_generation, nHiddenLayers, nNeurons, DIM);
    generation_fitness = evaluate_generation(popsize, weights, n_pairs, io_pairs, nHiddenLayers);

    for i = 1 : popsize
        if(generation_fitness(1,i) < fbest)
            fbest =  generation_fitness(1,i);
            idx = find(generation_fitness == fbest);
            weights_best = {weights{idx, 1} weights{idx, 2} weights{idx, 3}};
        end
    end

    next_generation = tournament(generation_fitness, pop, k_parents, popsize);
    next_generation = mutate(next_generation, mutate_rate);
    display(generations);
    addpoints(a, generations, fbest);
end

    error = zeros(1,n_pairs);
    for j = 1 : n_pairs
       input =  io_pairs {1}{j};
       f_desired(1,j) = io_pairs{2}(1, j);
       f_nn(1,j) = neural_net_function(input, weights_best, nHiddenLayers);
       error(1,j) = f_desired(1,j) - f_nn(1,j);
    end

end
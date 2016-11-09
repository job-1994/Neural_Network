function weights_best = Genetic_Algorithm(io_pairs, n_pairs, DIM)

init_popsize = 10000;
lim_generations = 100;
k_parents = 15;
mutate_rate = 0.005;
nHiddenLayers = 2;
nNeurons = 10;
variance = 1;
popsize = 200;
prune_size = popsize/init_popsize;

%create initial generation
pop = populate(init_popsize, DIM, nHiddenLayers, nNeurons);
weights = encode(pop, nHiddenLayers, nNeurons, DIM);

generation_fitness = evaluate_generation(init_popsize, weights, n_pairs, io_pairs, nHiddenLayers);

%Prune the initial generation down to secondary popsize
[pruned_gen, new_fitness] = prune_generation(pop, generation_fitness, true(), prune_size, 0);
%produce next generation through tournament selection using crossover
next_generation = tournament(new_fitness, pruned_gen, k_parents, popsize);
next_generation = mutate(next_generation, mutate_rate, variance);

fbest = inf;  

for generations = 1 : lim_generations
    weights = encode(next_generation, nHiddenLayers, nNeurons, DIM);
    generation_fitness = evaluate_generation(popsize, weights, n_pairs, io_pairs, nHiddenLayers);

    for i = 1 : popsize
        if(generation_fitness(1,i) < fbest)
            fbest =  generation_fitness(1,i);
            idx = find(generation_fitness == fbest);
            weights_best = {weights{idx, 1} weights{idx, 2} weights{idx, 3} weights{idx, 4}};
        end
    end

    next_generation = tournament(generation_fitness, pop, k_parents, popsize);
    next_generation = mutate(next_generation, mutate_rate, variance);
%     display(generations);
end

    error = zeros(1,n_pairs);
    for j = 1 : n_pairs
       input =  io_pairs {1}{j};
       f_desired(1,j) = io_pairs{2}(1, j);
       f_nn(1,j) = neural_net_function(input, weights_best, nHiddenLayers);
       error(1,j) = ((f_desired(1,j) - f_nn(1,j))/f_desired(1,j))*100;
    end
    
%     subplot(2,1,1)
%     b = bar(f_desired);
%     title('Neural Network Desired Ouput');
%     xlabel('I/O pair');
%     ylabel('Output');
%     
%     subplot(2,1,2)
%     c = bar(f_nn);
%     title('Neural Network Real Output');
%     xlabel('I/O Pair');
%     ylabel('Output');

end
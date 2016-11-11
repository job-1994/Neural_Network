function weights_best_l = Genetic_Algorithm(io_pairs, n_pairs, DIM)

init_popsize = 200;
lim_generations = 100;
k_parents = 10;
mutate_rate = 0.005;
nHiddenLayers = 2;
nNeurons = 2;
variance = 1;
popsize = 200;
initial_keep_size = popsize/init_popsize;
keep_size = 0.99;
prune_limit = 100;

%create initial generation
pop = populate(init_popsize, DIM, nHiddenLayers, nNeurons);
weights = encode(pop, nHiddenLayers, nNeurons, DIM);

generation_fitness = evaluate_generation(init_popsize, weights, n_pairs, io_pairs, nHiddenLayers);

%Prune the initial generation down to secondary popsize
[pruned_gen, new_fitness] = prune_generation(pop, generation_fitness, initial_keep_size);

%produce next generation through tournament selection using crossover
next_generation = tournament(new_fitness, pruned_gen, k_parents, popsize);
next_generation = mutate(next_generation, mutate_rate, variance);
current_popsize = size(next_generation, 1);
fbest = inf;  

for generations = 1 : lim_generations
    weights = encode(next_generation, nHiddenLayers, nNeurons, DIM);
    generation_fitness = evaluate_generation(current_popsize, weights, n_pairs, io_pairs, nHiddenLayers);
    
    if size(next_generation, 1) > prune_limit
        [next_generation, generation_fitness] = prune_generation(next_generation, generation_fitness, keep_size);
    end
    current_popsize = size(next_generation, 1);
    gene_length = size(next_generation);
    combined = [next_generation transpose(generation_fitness)];
    combined = sortrows(combined, gene_length(2)+1);
    
    if(combined(1,gene_length(2) + 1) < fbest)
        fbest =  combined(1,gene_length(2) + 1);
        weights_best = combined(1, 1 : gene_length(2));
    end
    line_matrix(generations,1) = generations;
    line_matrix(generations,2) = fbest;
    next_generation = tournament(generation_fitness, pop, k_parents, current_popsize);
    next_generation = mutate(next_generation, mutate_rate, variance);
%     display(generations);
end

    weights_best_l = encode(weights_best, nHiddenLayers, nNeurons, DIM);
    fitness_total = 0;
    for j = 1 : n_pairs
       input =  io_pairs {1}{j};
       f_desired(1,j) = io_pairs{2}(1, j);
       f_nn(1,j) = neural_net_function(input, weights_best_l, nHiddenLayers);
       fitness_total = fitness_total + fitness(f_desired(1,j), f_nn(1,j));
       error(1,j) = ((f_desired(1,j) - f_nn(1,j))/f_desired(1,j))*100;
    end
    fitness_total = fitness_total/n_pairs;
    
    for iter = 1 : size(f_desired, 2)
    graph_matrix(iter, 1) = f_desired(iter);
    graph_matrix(iter, 2) = f_nn(iter);
    end
    
    
    subplot(2,1,1)
    b = bar(graph_matrix);
    title('Neural Network Desired Ouput');
    xlabel('I/O pair');
    ylabel('Output');
    legend('FUN Test Output', 'Neural Net Ouput');
    
    subplot(2,1,2)
    line_x = line_matrix(:,1);
    line_y = line_matrix(:,2);
    c = plot(line_x, line_y, '-o');
    title('Fitness vs Generations');
    xlabel('Generations');
    ylabel('Fitness evaluation');

end
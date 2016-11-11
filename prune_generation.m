% population = pop to prune, fitness_of_population = fitnesses,
% initial_prune = true()/false() depending on if you want to cut down the
% first generation (i.e popsize 2000 cut down to 200), initial_keep_size =
% size of initial big prune (0 to 1, e.g 0.9 keeps the top 90%), prune_size
% = subsequent prune sizes ( 0 to 1, e.g 0.1 keeps the top 10%)

function  [p, f] = prune_generation(population, fitness_of_population, ...
    keep_size)

popsize = size(population,1);
gene_length = size(population,2);

copy_fitness = transpose(fitness_of_population);

pop_with_fit = [population copy_fitness];
pop_with_fit = sortrows(pop_with_fit, gene_length+1);

kill = round(popsize*keep_size);

pop_with_fit = pop_with_fit((1:kill),:);
copy_fitness = transpose(pop_with_fit((1:kill),gene_length+1));
pop_with_fit = pop_with_fit((1:kill),(1:gene_length));

pruned_pop = pop_with_fit;
new_fitness = copy_fitness;

p = pruned_pop;
f = new_fitness;
end
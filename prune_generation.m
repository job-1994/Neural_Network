% population = pop to prune, fitness_of_population = fitnesses,
% initial_prune = true()/false() depending on if you want to cut down the
% first generation (i.e popsize 2000 cut down to 200), initial_prune_size =
% size of initial big prune (0 to 1, e.g 0.9 keeps the top 10%), prune_size
% = subsequent prune sizes ( 0 to 1, e.g 0.1 keeps the top 90%)

function  [p, f] = prune_generation(population, fitness_of_population, ...
                initial_prune, initial_prune_size, prune_size)
  
        popsize = size(population,1);
        gene_length = size(population,2);
        rate = prune_size;
        
        if initial_prune == true()
            copy_fitness = transpose(fitness_of_population);
            
            pop_with_fit = [population copy_fitness];
            pop_with_fit = sortrows(pop_with_fit, gene_length+1);
            
            kill = popsize*initial_prune_size;
            
            pop_with_fit = pop_with_fit([1:kill],:);
            copy_fitness = transpose(pop_with_fit([1:kill],gene_length+1));
            pop_with_fit = pop_with_fit([1:kill],[1:gene_length]);
            
            pruned_pop = pop_with_fit;
            new_fitness = copy_fitness;         
        end
        
        if initial_prune == false()
            for i = 1:popsize           
            
            end
        end
        
        p = pruned_pop;
        f = new_fitness;
end
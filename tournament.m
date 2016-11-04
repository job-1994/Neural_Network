% Selects k parents to fight for the right to reproduce

function next_generation = tournament(fitness_array, pop, k_parents, popsize)
    next_generation = zeros(1, popsize);
    for idx = 1 : popsize
        select = randperm(popsize, k_parents);
    
        for i = 1 : k_parents
        check(1, i) = fitness_array(select(i)); 
        end
    
        f_parent1 = inf;
        f_parent2 = inf;
    
        %get two genes with the best fitnesses
        for i = 1 : k_parents
            if(fitness_array(select(i)) < f_parent1)
               if(f_parent1 < f_parent2)
                  f_parent2 = f_parent1; 
               end
           
            f_parent1 = fitness_array(select(i));
           
            elseif(fitness_array(select(i)) < f_parent2)
                f_parent2 = fitness_array(select(i));
            end
        end
    
        parent1 = pop(find(fitness_array==f_parent1),:);
        parent2 = pop(find(fitness_array==f_parent2),:);
        
        next_generation(1, idx) = child;
    end
end
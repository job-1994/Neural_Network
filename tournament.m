% Selects k random chromosomes, and chooses the two with the best fitnesses
% to be considered for reproduction in the crossover method.

function next_generation = tournament(fitness_array, pop, k_parents, popsize)
next_generation = zeros(popsize, size(pop,2));
for idx = 1 : popsize
    select = randperm(popsize, k_parents);
    f_parent1 = inf;
    f_parent2 = inf;
    
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
    child = crossover(parent1, parent2);
    next_generation(idx, :) = child(1,:);
end
end
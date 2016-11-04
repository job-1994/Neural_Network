function m = mutate(pop, rate)
    genes = size(pop,2);
    copy = pop;
    popsize = size(pop,1);
    
    for i = 1:popsize
        choose = rand;
        if(choose < rate)
            choose_gene = round(1+rand*(genes-1));
            copy(i, choose_gene) = -1 + (2)*rand;
        end
    end
    
    m = copy;
end

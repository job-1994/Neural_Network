function m = mutate(individual, rate)
    genes = size(individual,2);
    copy = individual;
    for i = 1:genes
        choose = rand;
        if(choose < rate)
            copy(i) = -1 + (2)*rand;
        end
    end
    m = copy;
end

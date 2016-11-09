%Normally distributed mutation
function m = mutate(pop, rate, variance_weight)
    genes = size(pop,2);
    copy = pop;
    popsize = size(pop,1);
    
    for i = 1:popsize
        choose = rand;
        if(choose <= rate)
            number_of_mutations = round(1+rand*(genes-1));
            for j = 1:number_of_mutations
                choose_gene = round(1+rand*(genes-1));
                if choose_gene == genes
                    variance_end_weight = floor(log(abs(copy(i, choose_gene)))./log(10));
                    copy(i, choose_gene) = copy(i, choose_gene) + sqrt(variance_end_weight).*randn();
                end
                if choose_gene ~= genes
                    copy(i, choose_gene) = copy(i, choose_gene) + sqrt(variance_weight).*randn();
                end
            end
        end
    end
    
    m = copy;

end
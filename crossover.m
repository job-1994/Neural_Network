% Returns a child from two parents, selceted through tournament,
% genetically altered through uniform crossover
function c = crossover(parent_1, parent_2)
genes = size(parent_1,2);
child = zeros(1,genes);

for i = 1:genes
    choose = round(1 + (2 - 1)*rand);
    
    if(choose == 1)
        child(1,i) = parent_1(1,i);
    end
    
    if(choose == 2)
        child(1,i) = parent_2(1,i);
    end
end
c = child;
end
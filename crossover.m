% Returns a 1x(number of genes) child

% Single point crossover

% function c = crossover(parent_1, parent_2)
%     genes = size(parent_1,2);
%     child = zeros(1,genes);
%     cut_point = round(1 + (genes - 1)*rand)
%     
%     for i = 1:cut_point
%         child(1,i) = parent_1(1,i);
%     end
%     
%     for j = (cut_point + 1):genes
%         child(1,j) = parent_2(1,j);
%     end
%     
%     c = child;
% end

% Uniform crossover

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
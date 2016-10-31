% Given a population, "P", return a cell of weights for every individual

function x = get_weights(P)
    
    popsize = size(P, 1);
    weights = cell(popsize, 4);
    
    for n = 1:popsize
    
    %   Get the weights for each layer and store in a multidimensional cell
    %   called weights
        for N = 1:4
            
            switch N

                case 1
                    weights{n, N} = [P(n, 1) P(n, 2); P(n, 3) P(n, 4)];

                case 2
                    weights{n, N} = [P(n, 5) P(n, 6); P(n, 7) P(n, 8)];

                case 3
                    weights{n, N} = [P(n, 9) P(n, 10); P(n, 11) P(n, 12)];

                case 4
                    weights{n, N} = [P(n, 13) P(n, 14)];

            end
        
        end
    
    end
    
    x = weights;
    
end
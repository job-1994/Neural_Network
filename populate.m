% %Generate a N by 14 matrix of random numbers in the range (-1, 1),
% %r = a + (b - a)*rand(N,1) where N is the number of individuals in the
% %population. Use p(X,:) to extract individual X from population.
% 
function p = populate(N, dimensions)
    genes = (2*dimensions) + 4 + 2;
    r1 = -1 + (1+1)*rand(genes,N);
    p = transpose(r1);
end
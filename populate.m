%Generate a N by 14 matrix of random numbers in the range (-1, 1),
%r = a + (b - a)*rand(N,1) where N is the number of individuals in the
%population. Use p(X,:) to extract individual X from population.

function p = populate(N)
    r1 = -1 + (1+1)*rand(14,N);
	p = transpose(r1);
end
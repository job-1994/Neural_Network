% Calculates the fitness of a generation, given a matrix of outputs, "out"

function f = fitness_func(out)
    for n = 1:size(out, 2)
%       Replace with a more approriate fitness function
        f = 1/out(n);
    end
end

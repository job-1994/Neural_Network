clear
clc

%Set the input values and number of individuals in the population
in = [2; 3];
pop = 3;

% Generate a population of size "pop", using the populate function
population = populate(pop);

% Get the weights from the population
weights = get_weights(population);

for n = 1:pop
    output = neural_net_function(weights(pop, :), in)
end
%Neural net

clear
clc

%Set the input values and number of individuals in the population
in = [2; 3];
pop = 5;

% Generate a population of size "pop", using the populate function
population = populate(pop);

% Generate container cells to store weights and neuronal calculations
weights = cell(pop,4);
neuron = weights;

% Generate an array to store the output value for every individual
outputs = zeros(1, pop);

%{ 
Here's where it get complicated fam. 

For every individual in the population: extract the weights (i.e. weight_1,
weight_2 etc), then perform the calculations using those weights.
%}
for n = 1:pop

%   Get the weights for each layer and store in a multidimensional cell
%   called weights
    for N = 1:4
       weights{n, N} = get_weights(population(n,:), N);
    end
    
%   For each layer, calculate the values and store them in "neuron" and
%   store the final output to "outputs"
    for i = 1:4
        if i == 1
            neuron{n, i} = tanh(weights{n, i}*in);
        else
            neuron{n, i} = tanh(weights{n, i}*neuron{n, i-1})            
            if i == 4
                outputs(n) = neuron{n, i}
            end            
        end
    end
    
end


%     A = tanh(weight_1*in);
%     B = tanh(weight_2*A);
%     C = tanh(weight_3*B);
%     D = tanh(weight_4*C);
% 
%     Out = transpose(D)
    
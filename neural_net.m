%function [ Out ] = neural_net(in, weights_1, weights_2, weights_3, weights_4)

in = [2,3];
weight_1 = [ 1 1;
             1 1];
weight_2 = [ 0.5 0.5;
             0.6 0.6];
weight_3 = [ 1 1;
             1 1];
weight_4 = [ -0.7 1];


in = transpose(in)
A = tanh(weight_1*in)
B = tanh(weight_2*A) + 1
C = tanh(weight_3*B)
D = tanh(weight_4*C);

Out = transpose(D)

% neural_net([2,3], [1 1; 1 1], [0.3 0.7; 0.6 0.5])
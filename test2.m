clc
clear
% pop_size = 2;
% dimensions = 4;
% nHiddenLayers = 2;
% neurons = 2;
% input = -5 + (5 + 5)*rand(dimensions,1);
% test = populate(pop_size, dimensions, nHiddenLayers, neurons);
% tested = encode(test, nHiddenLayers, neurons, dimensions);
% weight = {tested{1, 1} tested{1, 2} tested{1, 3} tested{1, 4}};
% 
% a = 1;
% b = 2;
%     
% input = transpose(input);
% input_weight_layer = weight{1};
% layer_output = a*tanh(b*input * input_weight_layer);
%     
% for layer = 1: nHiddenLayers
%     weight_layer = transpose(weight{2}{layer});
%     layer_output = a*tanh(b*layer_output * weight_layer);
% end
% 
% output_weight_layer = transpose(weight{3});
% layer_output = a*tanh(b*layer_output * output_weight_layer);
% % Output = weight{4}*(layer_output)
% Output = 100*(layer_output)
a = [92.9877838072613 95.7831308505617 81.0419882288202 89.7791263446016 84.6086650891911 83.1121374685828 79.9007778245289 87.2161011220105 108.261937528522 97.4390591641769 118.978005185283 87.8780476109465 102.112281260578 93.2995454584860 98.2250138409705];
b = [85.8582455741744 -87.9822087842685 87.2999446790998 85.4824552228108 -89.3164281014107 83.8291273712804 87.7496412607199 89.8737009074017 -89.6349849786350 89.9822980605229 -89.6399072037227 79.0681380514807 -85.5041232019367 89.5285993869422 -89.9961427950266];
for iter = 1 : size(a, 2)
    graph_matrix_l(iter, 1) = a(iter);
    graph_matrix_l(iter, 2) = b(iter);
end
graph_matrix_l
subplot(2,1,1)
c = bar(graph_matrix_l);
title('Neural Network Real vs Desired Ouput');
xlabel('Input');
ylabel('Output');





x = [0 1 2 3 4 5 6 7 8 9];
y = [0 1 5 6 8 7 4 5 9 1];
subplot(2,1,2)
z = plot(x,y,'-o');


     
     
     
     
     
     


% MY_OPTIMIZER(FUN, DIM, ftarget, maxfunevals)
% samples new points uniformly randomly in [-5,5]^DIM
% and evaluates them on FUN until ftarget of maxfunevals
% is reached, or until 1e8 * DIM fevals are conducted.
function xbest = MY_OPTIMIZER(FUN, DIM, ftarget, maxfunevals)
maxfunevals = min(1e8 * DIM, maxfunevals);
NPairs = 15;
%Get random FUN Input/Output pairs for MLP training
pairs = get_test_pairs(NPairs, DIM, FUN);

%Train MLP and retrieve best approximation weights.
weight_best = Genetic_Algorithm(pairs, NPairs, DIM);

%Input random values into NN untill either ftarget or maxfunevals has been
%reached
comparison_matrix = zeros(2,maxfunevals);
fbest = inf;
output = zeros(2,maxfunevals);
for iter = 1 : maxfunevals
    input_test = -5 + (5+5)*rand(DIM,1);
    desired_test_value = feval(FUN,input_test);
    output(1,iter) = desired_test_value;
    input_test = transpose(input_test);
    real_test_value = neural_net_function(transpose(input_test), weight_best, 2);
    output(2,iter) = real_test_value;
    comparison_matrix(iter,1) = desired_test_value;
    comparison_matrix(iter,2) = real_test_value;
    if(fbest > real_test_value)
        fbest =  real_test_value;
    end
%     if fbest < ftarget
%         break;
%     end
end
% figure
% d = bar(comparison_matrix);

input_l = [-5:0.25:5];
for iter = 1: size(input_l, 2)
    input_p(1, 1) = input_l(1, iter);
    input_p(2, 1) = input_l(1, iter);
    
    out(1, iter) = feval(FUN,input_p);
    out_nn(1, iter) = neural_net_function(input_p, weight_best, 2);
end

figure
subplot(2,1,1)
sc = scatter3(input_l, input_l, out);
title('COCO FUN output');

subplot(2,1,2)
scd = scatter3(input_l, input_l, out_nn)
title('Approximated FUN output through Neural Network');
rotate3d on
end



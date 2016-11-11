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
    comparison_matrix(1,iter) = desired_test_value;
    comparison_matrix(2,iter) = real_test_value;
    if(fbest > real_test_value)
        fbest =  real_test_value;
    end
    if fbest < ftarget
        break;
    end
end

end



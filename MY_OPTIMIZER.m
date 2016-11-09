function xbest = MY_OPTIMIZER(FUN, DIM, ftarget, maxfunevals)
% MY_OPTIMIZER(FUN, DIM, ftarget, maxfunevals)
% samples new points uniformly randomly in [-5,5]^DIM
% and evaluates them on FUN until ftarget of maxfunevals
% is reached, or until 1e8 * DIM fevals are conducted. 

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
for iter = 1 : maxfunevals
    input_test = -5 + (5+5)*rand(DIM,1);   
    desired_test_value = feval(FUN,input_test);
    input_test = transpose(input_test);
    real_test_value = neural_net_function(transpose(input_test), weight_best, 2);
    comparison_matrix(1,iter) = desired_test_value;
    comparison_matrix(2,iter) = real_test_value;
    if(fbest > real_test_value)
       fbest =  real_test_value;
    end
    if fbest < ftarget
        disp('BREAK WAS REACHED');
        break;
    end
end
        disp('   real      target');
        x = [fbest, ftarget];
        disp(x);
%         x_bar = [feval(FUN, 'fbest') ftarget;];
%         y = bar(x);
  end 

  

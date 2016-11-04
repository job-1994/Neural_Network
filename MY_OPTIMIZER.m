function xbest = MY_OPTIMIZER(FUN, DIM, ftarget, maxfunevals)
% MY_OPTIMIZER(FUN, DIM, ftarget, maxfunevals)
% samples new points uniformly randomly in [-5,5]^DIM
% and evaluates them on FUN until ftarget of maxfunevals
% is reached, or until 1e8 * DIM fevals are conducted. 

  maxfunevals = min(1e8 * DIM, maxfunevals); 
  popsize = min(maxfunevals, 200);
  NPairs = 10;
%Get random FUN Input/Output pairs for MLP training
pairs = get_test_pairs(NPairs, DIM, FUN);

%Train MLP
weight_best = Genetic_Algorithm(pairs, NPairs, DIM);

%Input random values into FUN and MLP, to determine MLP accuracy
  
   
for iter=1:10
    weights = populate(popsize,DIM);
    encoded_weights = encode(weights, DIM);
    neural_out = neural_net_function(encoded_weights, in);
    fitness_value = feval(FUN, transpose(neural_out));
    if fbest > fitness_value
        fbest = fitness_value;
    end
    if feval(FUN, 'fbest') < ftarget         % COCO-task achieved
      break;                                 % (works also for noisy functions)
    end
end

%  for iter = 1:ceil(maxfunevals/popsize)
%    xpop = 10 * rand(DIM, popsize) - 5;      % new solutions
%    [fvalues, idx] = sort(feval(FUN, xpop)); % evaluate

    
    
%    if fbest > fvalues(1)                    % keep best
%     fbest = fvalues(1);
%     xbest = xpop(:,1);
%    end
%    if feval(FUN, 'fbest') < ftarget         % COCO-task achieved
%      break;                                 % (works also for noisy functions)
%    end
  end 

  

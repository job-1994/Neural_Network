function pairs = get_test_pairs(n_pairs, DIM, FUN)
    inputs = cell(1,n_pairs);
    outputs = zeros(1,n_pairs);
    pairs = cell(1,2);
    
    for i = 1:n_pairs
        input =  -5 + (5+5)*rand(1, DIM);
        inputs{1,i} = transpose(input);
    end

    for j = 1:n_pairs
        outputs(1,j) = feval(FUN, inputs{1,j});
    end
    
    pairs{1,1} = inputs;
    pairs{1,2} = outputs;
end
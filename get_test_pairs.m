function pairs = get_test_pairs(n_pairs, DIM, FUN)
    inputs = cell(n_pairs);
    for i = 1:n_pairs
        input =  -5 + (5+5)*rand(1, DIM);
        inputs{i} = transpose(input);
    end
    outputs = zeros(1,n_pairs);
    for j = 1:n_pairs
        outputs(j) = feval(FUN, inputs{j});
    end
    pairs = {inputs, outputs};
end
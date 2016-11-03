

function p = get_test_pairs(N)
    p = zeros(N,2);
    count = -1*((N-1)/2);
    for i = 1:N
        p(i,1) = count;
        p(i,2) = 0;
        count = count + 1;
    end
    
end

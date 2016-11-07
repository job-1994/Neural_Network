
function f = fitness(f_desired, f_nn)
    f = (f_desired-f_nn).^2;
end
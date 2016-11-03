
function f = fitness(f_desired, f_nn)
    f = (abs(f_desired)-abs(f_nn)).^3;
end

function f = fitness(f_desired, f_nn)
    %f = (abs(f_desired)-abs(f_nn)).^2;
    f = (f_desired-f_nn).^2;
end

function f = fitness(desired, nn)
%     f = abs(desired-nn);

error_margin = 0.1;
error_less = 1 - error_margin;
error_greater = 1 + error_margin;
item_count = size(desired);

within = 0;
outwith = 0;
difference_total = 0;
for iter = 1 : item_count(2)
    test_nn = nn(1, iter);
    test_desired = desired(1, iter);
    difference_total = difference_total + abs(test_desired - test_nn);
    if test_nn < error_less * test_desired
        outwith = outwith + 1;
        
    elseif test_nn > error_greater * test_desired
        outwith = outwith + 1;
        
    else
        within = within + 1;
    end 
end

f = within/(within + outwith)*100;
if f == 0
    f = 1;
end
f = difference_total/f;

end
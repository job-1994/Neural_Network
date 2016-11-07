%function graphing(graph_matrix)
clear;
clc;


graph_matrix = zeros(13, 2);
    
subplot(2,1,2);
    a = animatedline;
    clearpoints(a);
    title('Best Fitness per Generations');
    xlabel('Generations');
    ylabel('f best');  
for j = 1 : 8
    for i  = 1 : 13
        graph_matrix(i, 1) = i + j;
        graph_matrix(i,2) = i + j;
    end
    
    subplot(2,1,1)
    b = bar(graph_matrix);
    title('Neural Network vs FUN output');
    xlabel('Generations');
    ylabel('Output');
    legend('desired','real', 'Location','northwest');
    
    x = j;
    y = j.^2;
    addpoints(a, x, y); 
    pause(0.5);

end
%end
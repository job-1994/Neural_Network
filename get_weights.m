%Return the weights for a given layer, N, from and individual, I

function x = get_weights(I, N)

    switch N
        
        case 1
            x = [I(1) I(2); I(3) I(4)];
        
        case 2
            x = [I(5) I(6); I(7) I(8)];
            
        case 3
            x = [I(9) I(10); I(11) I(12)];
            
        case 4
            x = [I(13) I(14)];
            
    end
    
end
function Y = epochdata(X,epochlen,idx)

    if epochlen==10
        Y = X{idx};
        
    elseif epochlen==20
        Y = [X{idx}; X{idx+1}];
        
    elseif epochlen==30
        Y = [X{idx}; X{idx+1}; X{idx+2}];
        
    else
        error('Epoch length must be 10, 20 or 30 seconds');     
    
    end
    
end
%eof epochdata()
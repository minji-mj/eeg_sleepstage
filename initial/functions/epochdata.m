function Y = epochdata(X,epochlen,idx)

    % 10-s epochs
    if epochlen==10
        Y = X{idx};
        
    % 20-s epochs
    elseif epochlen==20
        Y = [X{idx}; X{idx+1}];
    
    % 30-s epochs
    elseif epochlen==30
        Y = [X{idx}; X{idx+1}; X{idx+2}];
        
    else
        error('Epoch length must be 10, 20 or 30 seconds');     
    
    end
    
end
%eof epochdata()
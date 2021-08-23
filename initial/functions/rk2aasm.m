function aasm = rk2aasm(rk)
%RK2AASM() converts annotaions from R&K method to AASM method
%   R&K  : N/A, Sleep stage W, 1, 2, 3, 4, R
%   AASM : N/A, W, N1, N2, N3, R
    
    aasm = string(ones(length(rk),1));
    
    for j=1:length(rk)
        
        if rk(j)=="Sleep stage W"
            aasm(j) = "W";
        elseif rk(j)=="Sleep stage 1"
            aasm(j) = "N1";
        elseif rk(j)=="Sleep stage 2"
            aasm(j) = "N2";
        elseif or(rk(j)=="Sleep stage 3",rk(j)=="Sleep stage 4")
            aasm(j) = "N3";
        elseif rk(j)=="Sleep stage R"
            aasm(j) = "R";
        else
            aasm(j) = "N/A";
        end  
    end
    
end
%eof

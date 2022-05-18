function STf = stage4(STi)
%STAGE4() converts annotaions from AASM method to four stages
%   AASM   : N/A, W, N1, N2, N3, R
%   Stage4 : N/A, Wake, Light, Deep, REM 
    
    STf = string(ones(length(STi),1));
    
    for j=1:length(STf)
        
        if STi(j)=="W"
            STf(j) = "Wake";
        elseif or(STi(j)=="N1",STi(j)=="N2")
            STf(j) = "Light";
        elseif STi(j)=="N3"
            STf(j) = "Deep";
        elseif STi(j)=="R"
            STf(j) = "REM";
        else
            STf(j) = "N/A";
        end  
    end
    
end
%eof

function Y = ft_LZC(X)
%FT_LZC() Lempel-Ziv Complexity feature

    medX = median(X);
    for i=1:length(X)
        if (X(i)<medX)
            X(i)=0;
        else
            X(i)=1;
        end
    end
    Y = kolmogorov(X);
    
end
%eof
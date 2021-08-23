function features = extractfeatures(X,fs,bands)
%EXTRACTFEATURES()
    
    % bands
    %   {all, delta, theta, alpha, beta, gamma}
    B = ones(length(bands),2);
    for i=1:length(bands)
        B(i,:)=bands{i};
    end
    
    fBP = ft_bandpower(X,fs,B);
    fLZC = ft_LZC(X);
    features = [fBP fLZC];

end
%eof
function Y = ft_bandpower(X,fs,bands)
% biosig's bandpower (needs biosig toolbox)

    bpmode = 2;
    smoothing = 2.5; % seconds
    bp = bandpower(X,fs,bands,smoothing,bpmode);
    
    tot = norm(bp(:,1))^2;
    delta = norm(bp(:,2))^2;
    theta = norm(bp(:,3))^2;
    alpha = norm(bp(:,4))^2;
    beta = norm(bp(:,5))^2;
    gamma = norm(bp(:,6))^2;
    
    
    rAD = alpha/delta;
    rGD = gamma/delta;
    rAT = alpha/theta;
    rBT = beta/theta;
    rDT = delta/theta;
    rA = alpha/tot;
    
    Y = [delta theta alpha beta gamma 1/rAD 1/rGD rAT rBT rDT rA];
end
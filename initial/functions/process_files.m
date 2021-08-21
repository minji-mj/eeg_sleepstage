function [data,label] = process_files(datafile,annotfile)

    epochlen = 30;  % epoch length, seconds
                    % supported epoch lengths: 10s, 20s, 30s
                    
    bands = [   [0.5    30];    ... pre-filter band
                [1      4];     ... delta
                [4      8];     ... theta
                [8      13];    ... alpha
                [13     22];    ... beta
                [30     35]     ... gamma
            ];

    % Throw error if number of data and annotation files misaligned
    if ~isequal(length(datafile),length(annotfile))
        error('Number of files not equal');
    end
    
    % Iterate over files
%     fprintf("Number of datasets: %d\n", length(datafile));

    for k=1:length(datafile)
%         fprintf("%d/%d datafile\n",k,length(datafile));
        
        
        
        tt = edfread(datafile(k));
        
        % Iterate over epoch data
        for i=1:epochlen/10:height(tt)-mod(height(tt),epochlen/10)
            
            % Epoch data
            fpzcz = epochdata(tt.EEGFpz_Cz,epochlen,i);
            pzoz = epochdata(tt.EEGPz_Oz, epochlen,i);
            
            % Pre-filter
            
            
        end
    end
    
    data = [];
    label = [];
    
end
%eof process_files()
%%
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
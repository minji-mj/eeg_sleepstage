function [data,label] = process_files(datafile,annotfile)

    data = [];
    label = [];
    
    fs = 100;       % sampling frequency, Hz
    
    epochlen = 30;  % epoch length, seconds
                    % supported epoch lengths: 10s, 20s, 30s
                    
    bands = {   [1      30];    ... pre-filter band
                [1      4];     ... delta
                [4      8];     ... theta
                [8      13];    ... alpha
                [13     22];    ... beta
                [30     35]     ... gamma
            };

    % Throw error if number of data and annotation files misaligned
    if ~isequal(length(datafile),length(annotfile))
        error('Number of files not equal');
    end
    
    fprintf("Starting feature extraction over %d datafiles..\n",length(datafile));
    
    % Iterate over files
    for k=1:length(datafile)
        tic
        fprintf("\tDatafile(%d/%d):\t'%s'\n",k,length(datafile),datafile(k));
        fprintf("\t\t\t\t\t");
        
        tt = edfread(datafile(k));
        
        % Iterate over epoch data
        features = [];
        for i=1:epochlen/10:height(tt)-mod(height(tt),epochlen/10)
            
            % Epoch data
            fpzcz = epochdata(tt.EEGFpz_Cz,epochlen,i);
            pzoz = epochdata(tt.EEGPz_Oz, epochlen,i);
            
            % Pre-filter
            fpzcz = butterbpf(fpzcz,fs,bands{1});
            pzoz = butterbpf(pzoz,fs,bands{1});
            
            % Extract features
            ft_fpzcz = extractfeatures(fpzcz,fs,bands);
            ft_pzoz = extractfeatures(pzoz,fs,bands);
            
            features = [features;ft_fpzcz ft_pzoz];
        end
        
        toc
        data = [data;features];
        fprintf("\t\t\t\t\t%dx%d features extracted.\n",height(data),width(data));
    end
    fprintf("Feature extraction complete.\n\n");
    
    fprintf("Converting annotations for %d hypnogram files..\n",length(annotfile));
    
end
%eof process_files()
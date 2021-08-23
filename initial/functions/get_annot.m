function annotations = get_annot(filename,epochnum,epochlen)
%GET_ANNOT() read annotations from sleep-edf Hypnogram file and convert to
%appropriate epochs and labels

    % Read annotations from hypnogram file
    annotations = string(ones(epochnum,1));
    [~,annot] = edfread(filename);
    
    % Each duration indices
    st = seconds(annot.Onset)/epochlen + 1;             % start index
    ed = (st-1) + seconds(annot.Duration)/epochlen;     % end index
    
    % Annotations from duration to epochs
    for i=1:height(annot)
        annotations(st(i):ed(i)) = annot.Annotations(i);
    end
    
    % Initial epochs not annotated
    if st(1)>1
        annotations(1:st(1)-1) = "N/A";
    end
    
    % Final epochs not annotated
    if ed(end)<epochnum
        annotations(ed(end)+1:epochnum) = "N/A";
    
    elseif ed(end)>epochnum
        % If more epochs are scored, remove to match dimensions
        annotations(epochnum+1:end)=[];
    end
    
    % Convert from R&K to AASM sleep stages
    % N/A, W, N1, N2, N3, R
    annotations = rk2aasm(annotations);
    
    % Conversion to four sleep stages
    % N/A, Wake, Light, Deep, REM
    annotations = stage4(annotations);

end
%eof


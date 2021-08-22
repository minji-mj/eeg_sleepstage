function annotations = get_annot(filename,epochnum,epochlen)

    annotations = string(ones(epochnum,1));
    [~,annot] = edfread(filename);
    
    st = seconds(annot.Onset)/epochlen + 1;
    ed = (st-1) + seconds(annot.Duration)/epochlen;
    
    for i=1:height(annot)
        annotations(st(i):ed(i)) = annot.Annotations(i);
    end
    
    % Initial epochs not annotated
    if st(1)>1
        annotations(1:st(1)-1) = "N/A";
    end
    
    % Final epochs not annotated
    if ed(end)<epochnum
%         annotations(ed(end)+1:epochnum) = annot.Annotations(end);
        annotations(ed(end)+1:epochnum) = "N/A";
    end
    
    annotations = rk2aasm(annotations);
end


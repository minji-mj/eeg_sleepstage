function annotations = get_annot(filename,epochnum,epochlen)

    annotations = string(ones(epochnum,1));
    [~,annot] = edfread(filename);
    
    st = seconds(annot.Onset)/epochlen + 1;
    ed = (st-1) + seconds(annot.Duration)/epochlen;
    
    for i=1:height(annot)
        annotations(st(i):ed(i)) = annot.Annotations(i);
    end
    
    % Initial epochs not annotated, then stage as "wake"
    if st(1)>1
        annotations(1:st(1)-1) = "Sleep stage W";
    end
    
    if ed(end)<epochnum
        annotations(ed(end)+1:epochnum) = annot.Annotations(end);
    end
end


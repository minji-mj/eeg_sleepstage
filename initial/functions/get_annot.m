function annotations = get_annot(filename,epochnum,epochlen)

    annotations = string(ones(epochnum,1));
    [~,annot] = edfread(filename);
    
    st = seconds(annot.Onset)/epochlen + 1;
    ed = (st-1) + seconds(annot.Duration)/epochlen;
    
    for i=1:height(annot)
        annotations(st(i):ed(i)) = annot.Annotations(i);
    end
    
    if ed(end)<epochnum
        annotations(ed(end)+1:epochnum) = annot.Annotations(end);
    end
end


function [psgfile,hypfile] = retrieve_files(dirname,varargin)
%RETRIEVE_FILES() retrieve data files and annotation filenames from directory
%   retrieve_files(dirname) returns all files from directory
%   retrieve_files(dirname,N) returns N files from directory

    psg = dir([dirname '/*PSG.edf']);
    hyp = dir([dirname '/*Hypnogram.edf']);
    
    % Error handling: mismatch of number of files
    if ~isequal(length(psg),length(hyp))
        error('Number of data files not equal to number of annotation files');
    end
    
    % Input argument(s)
    if nargin==1
        numfiles = length(psg);
    elseif nargin==2
        numfiles = varargin{1};
    else
        error('Too many input arguments');
    end
    
    % Filenames
    psgfile = string(ones(numfiles,1));
    hypfile = string(ones(numfiles,1));
    
    for k=1:numfiles
        psgfile(k) = [dirname '/' psg(k).name];
        hypfile(k) = [dirname '/' hyp(k).name];
    end
    
end


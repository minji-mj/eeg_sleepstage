clear;clc;close all;
format long;
addpath('functions');

% Main File
% Classify Sleep Stages using Sleep-EDF datasets (PhysioNet)

% Retrieve files
% Default setting uses all files from directory
%       i.e. [datafile,annotfile] = retrieve_files(dirname)
% Specify number of files to use less number of files
%       e.g. [datafile,annotfile] = retrieve_files(dirname,10);
dirname = 'sleep-edf-telemetry';
[datafile,annotfile] = retrieve_files(dirname,10);

% Prepare data and label for model
[data,label] = process_files(datafile,annotfile);

%eof
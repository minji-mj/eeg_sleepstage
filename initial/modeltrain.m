% modeltrain.m
%
% Classify Sleep Stages using Sleep-EDF datasets (PhysioNet)
% As per AASM guidelines: 
%       W(Wake), N1(Stage 1), N2(Stage 2), N3(Stage 3), R(REM)

clear;clc;close all;
format long;
addpath(genpath(pwd))

% Retrieve files
% Default setting uses all files from directory
%       i.e. [datafile,annotfile] = retrieve_files(dirname)
% Specify number of files to use less number of files
%       Take first N files from directory
%       e.g. [datafile,annotfile] = retrieve_files(dirname,N);

dirname = 'sleep-edf-telemetry';
[datafile,annotfile] = retrieve_files(dirname);

% Prepare data and label for model
[data,label] = process_files(datafile,annotfile);

% Train model
fprintf("Preparing model train..\n");

%eof
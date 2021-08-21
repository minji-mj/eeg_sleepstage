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
%       e.g. [datafile,annotfile] = retrieve_files(dirname,10);

dirname = 'sleep-edf-telemetry';
[datafile,annotfile] = retrieve_files(dirname,10);

% Prepare data and label for model
[data,label] = process_files(datafile,annotfile);

% Train model

%eof
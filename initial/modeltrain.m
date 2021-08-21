clear;clc;close all;
format long;
addpath('functions');

% Main File
% Classify Sleep Stages using Sleep-EDF datasets (PhysioNet)

% Retrieve files
dirname = 'sleep-edf-telemetry';
[datafile,annotfile] = retrieve_files(dirname);

fs = 100;   % sampling frequency, Hz

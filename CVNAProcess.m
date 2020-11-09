function [ meanpks,meanw,count] = CVNAProcess(signal,datastart,dataend,tstart)
%CVNAProcess function to process CVNA data
%   signal = variable containing the integrated signal timeseries
%   datastart = 
%   dataend = 
%   tstart = start time in minutes of the analysis window

%set start time in sample index and samples to analyze
    sampling = 4000;
    window_width = 20;
    tstart = tstart*sampling*60;
    samples = sampling*window_width*60;
    
    
    
    %select a time window from the last block of imported Labchart data
    %of specified width from the selected start time
    s = size(datastart);
    segment = signal(datastart(s(2))+tstart:datastart(s(2))+tstart+samples);
    
    %initialize a new figure and show the peak analysis result.
    figure();
    [pks,locs,w] = findpeaks(segment,'MinPeakProminence',mean(segment),'WidthReference','halfheight');
    
    %returns the mean amplitude of the identified peaks, the mean width of
    %the identified peaks and their count averaged  of the specified
    %minutes
    meanpks=mean(pks);
    meanw = mean(w);
    dimensions = size(pks);
    average_window= 10;
    ratio = window_width/average_window;
    count = dimensions(2);
    count = count/ratio;
 end


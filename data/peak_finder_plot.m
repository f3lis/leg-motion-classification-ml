function [x_peak y_peak] = peak_finder_plot(x, y)
    % This function takes in an x and y matrix of coordinates and return
    % the peaks of the data set. It also plots the data with red stars at
    % each peak.
    
    % establish empty vectors to store our peak values in
    x_peak = [] ;
    y_peak = [] ;
    j = 1 ; % sets a counting variable for the peak matrices
    
    % iterate through our coordinates
    for i = 1:length(x)
        % check if we are at the beginning or end of the data set
        if i == 1 || i == length(x)
            continue
            
        % check the peak condition
        elseif y(i+1) < y(i) && y(i-1) < y(i)
            x_peak(j) = x(i) ;
            y_peak(j) = y(i) ;
            j = j + 1 ;
            
        % move on if we have not seen a peak
        else
            continue
            
        end
    end
    
end
function [x_p y_p] = peak_finder_plot(x, y)
    % This function takes in an x and y matrix of coordinates and return
    % the peaks of the data set. 
    
    x_p = [] ;
    y_p = [] ;
    a = 1 ; 
    
    % iterate through our coordinates
    for i = 1:length(x)
        % check if we are at the beginning or end of the data set
        if i == 1 || i == length(x)
            continue
            
        % check the peak condition
        elseif y(i+1) < y(i) && y(i-1) < y(i)
            x_p(a) = x(i) ;
            y_p(a) = y(i) ;
            a = a + 1 ;
            
        else
            continue
            
        end
    end
    
end
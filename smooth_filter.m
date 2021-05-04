function [data] = smooth_filter(data)
%moving average filter for data to remove noise
data=smoothdata(data,'movmean',15);
end


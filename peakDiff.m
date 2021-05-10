function pd = peakDiff(pkArray)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
n = length(pkArray);
elemDiff = [];
for i = 2:1:n
    elemDiff(i-1) = (pkArray(i)-pkArray(i-1));
end
pd = elemDiff;
end


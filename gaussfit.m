function [y_loc,x_loc,width]=gaussfit(x,y)
% Gaussfit outputs the y,x,width of the gaussian from a quadratic fit
% This is an application of Caruana's algorithm which relates
% quadratic to Gaussian using logscaled data
% Input: x,y data
% Output: y,x,width of Gaussian
maxy = max(y);
for p = 1:length(y)
    % Prevent errors from negative log
    if y(p)<(maxy/1000)
        y(p)=maxy/1000;
    end
end
logy_scale=log(abs(y));
coef = gaussnewt(x,logy_scale);
c = coef(3);b = coef(2);a = coef(1);
mu = mean(x);
sigma = std(x);
% Compute peak position and height of the fitted parabola
x_loc = -((sigma.*b/(2*a))-mu);
y_loc = exp(c-a*(b/(2*a))^2);
width = norm(sigma.*2.35703/(sqrt(2)*sqrt(-1*a)));
end
function [plt1,plt2,plt3,plt4] = xyzabsPeaks(aw1_x_sm)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% Find peaks of x acceleration
P1_x = findpeaksG(tw1,aw1_x_sm,0,0.2,1,1);
w1_x_pk_x = P1_x(:,2); %Posn of peaks
w1_x_pk_y = P1_x(:,3);
w1_x_deltashft = 0; 

% Find peaks of y acceleration
P1_y = findpeaksG(tw1,aw1_y_sm,0,-1,5,5);
w1_y_pk_x = P1_y(:,2); %Posn of peaks
w1_y_pk_y = P1_y(:,3);
w1_y_deltashft = 0; 

% Find peaks of z acceleration
P1_z = findpeaksG(tw1,aw1_z_sm,0,-1,5,5);
w1_z_pk_x = P1_z(:,2); %Posn of peaks
w1_z_pk_y = P1_z(:,3);
w1_z_deltashft = -0.15; 

% Find peaks of absolute acceleration
P1_abs = findpeaksG(tw1,aw1_abs_sm,0,-1,5,5);
w1_abs_pk_x = P1_abs(:,2); %Posn of peaks
w1_abs_pk_y = P1_abs(:,3);
w1_abs_deltashft = -0.15; 

% Plots of the Walking Data
plt1 = plotw1_x = plotPeaks(tw1,aw1_x_sm,...
    w1_x_pk_x,w1_x_pk_y,w1_x_deltashft,'X-Direction');

plt2 = plotw1_y = plotPeaks(tw1,aw1_y_sm,...
    w1_y_pk_x,w1_y_pk_y,w1_y_deltashft,'Y-Direction');

plt3 = plotw1_z = plotPeaks(tw1,aw1_z_sm,...
    w1_z_pk_x,w1_z_pk_y,w1_z_deltashft,'Z-Direction');

plt4 = plotw1_abs = plotPeaks(tw1,aw1_abs_sm,...
    w1_abs_pk_x,w1_abs_pk_y,w1_abs_deltashft,'Absolute');

end


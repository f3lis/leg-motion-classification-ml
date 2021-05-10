clc; clear; close all;

fprintf('24-311 Numerical Method Peak Finding\n');

%% Section 1 : Data Import
% Importing the raw data:
% 1 = Priya, 2 = Aurielle, 3 = Sharon, 4 = Anon1, 5 = Anon2, 6 = Andrew
% WALKING
w1 = readmatrix('walking_priya.xls');
w2 = readmatrix('walking_auri.xls');
w3 = readmatrix('walking_sharon.xls');
w4 = readmatrix('walking_anon1.xls');
w5 = readmatrix('walking_anon2.xls');
w6 = readmatrix('walking_andrew.xls');

% RUNNING
r1 = readmatrix('running_priya.xls');
r2 = readmatrix('running_auri.xls');
r3 = readmatrix('running_sharon.xls');
r4 = readmatrix('running_anon1.xls');
r5 = readmatrix('running_anon2.xls');

% JUMPING
j1 = readmatrix('jumping_priya.xls');
j2 = readmatrix('jumping_auri.xls');
j3 = readmatrix('jumping_sharon.xls');
j4 = readmatrix('jumping_anon1.xls');
j5 = readmatrix('jumping_anon2.xls');
j6 = readmatrix('jumping_andrew.xls');

%% Section 2 : Creating columns for each data set to be stored in variables

% WALKING COLUMNS
% Walking 1
tw1 = w1(:,1);
aw1_x = w1(:,2);
aw1_y = w1(:,3);
aw1_z = w1(:,4);
aw1_abs = w1(:,5);
% Walking 2
tw2 = w2(:,1);
aw2_x = w2(:,2);
aw2_y = w2(:,3);
aw2_z = w2(:,4);
aw2_abs = w2(:,5);
% Walking 3
tw3 = w3(:,1);
aw3_x = w3(:,2);
aw3_y = w3(:,3);
aw3_z = w3(:,4);
aw3_abs = w3(:,5);
% Walking 4
tw4 = w4(:,1);
aw4_x = w4(:,2);
aw4_y = w4(:,3);
aw4_z = w4(:,4);
aw4_abs = w4(:,5);
% Walking 5
tw5 = w5(:,1);
aw5_x = w5(:,2);
aw5_y = w5(:,3);
aw5_z = w5(:,4);
aw5_abs = w5(:,5);
% Walking 6
tw6 = w6(:,1);
aw6_x = w6(:,2);
aw6_y = w6(:,3);
aw6_z = w6(:,4);
aw6_abs = w6(:,5);

%% RUNNING COLUMNS
% Running 1 
tr1 = r1(:,1);
ar1_x = r1(:,2);
ar1_y = r1(:,3);
ar1_z = r1(:,4);
ar1_abs = r1(:,5);
% Running 2
tr2 = r2(:,1);
ar2_x = r2(:,2);
ar2_y = r2(:,3);
ar2_z = r2(:,4);
ar2_abs = r2(:,5);
% Running 3
tr3 = r3(:,1);
ar3_x = r3(:,2);
ar3_y = r3(:,3);
ar3_z = r3(:,4);
ar3_abs = r3(:,5);
% Running 4
tr4 = r4(:,1);
ar4_x = r4(:,2);
ar4_y = r4(:,3);
ar4_z = r4(:,4);
ar4_abs = r4(:,5);
% Running 5
tr5 = r5(:,1);
ar5_x = r5(:,2);
ar5_y = r5(:,3);
ar5_z = r5(:,4);
ar5_abs = r5(:,5);

%% JUMPING COLUMNS
% Jumping 1 
tj1 = j1(:,1);
aj1_x = j1(:,2);
aj1_y = j1(:,3);
aj1_z = j1(:,4);
aj1_abs = j1(:,5);
% Jumping 2
tj2 = j2(:,1);
aj2_x = j2(:,2);
aj2_y = j2(:,3);
aj2_z = j2(:,4);
aj2_abs = j2(:,5);
% Jumping 3
tj3 = j3(:,1);
aj3_x = j3(:,2);
aj3_y = j3(:,3);
aj3_z = j3(:,4);
aj3_abs = j3(:,5);
% Jumping 4
tj4 = j4(:,1);
aj4_x = j4(:,2);
aj4_y = j4(:,3);
aj4_z = j4(:,4);
aj4_abs = j4(:,5);
% Jumping 5
tj5 = j5(:,1);
aj5_x = j5(:,2);
aj5_y = j5(:,3);
aj5_z = j5(:,4);
aj5_abs = j5(:,5);
% Jumping 6
tj6 = j6(:,1);
aj6_x = j6(:,2);
aj6_y = j6(:,3);
aj6_z = j6(:,4);
aj6_abs = j6(:,5);

%% Section 3 : Smooth Data using Gaussian filter and window of 50

% Walking Data 1
aw1_x_sm = smoothdata(aw1_x,'gaussian',50);
aw1_y_sm = smoothdata(aw1_y,'gaussian',50);
aw1_z_sm = smoothdata(aw1_z,'gaussian',50);
aw1_abs_sm = smoothdata(aw1_abs,'gaussian',50);

% Walking Data 2
aw2_x_sm = smoothdata(aw2_x,'gaussian',50);
aw2_y_sm = smoothdata(aw2_y,'gaussian',50);
aw2_z_sm = smoothdata(aw2_z,'gaussian',50);
aw2_abs_sm = smoothdata(aw2_abs,'gaussian',50);

% Walking Data 3
aw3_x_sm = smoothdata(aw3_x,'gaussian',50);
aw3_y_sm = smoothdata(aw3_y,'gaussian',50);
aw3_z_sm = smoothdata(aw3_z,'gaussian',50);
aw3_abs_sm = smoothdata(aw3_abs,'gaussian',50);

% Walking Data 4
aw4_x_sm = smoothdata(aw4_x,'gaussian',50);
aw4_y_sm = smoothdata(aw4_y,'gaussian',50);
aw4_z_sm = smoothdata(aw4_z,'gaussian',50);
aw4_abs_sm = smoothdata(aw4_abs,'gaussian',50);

% Walking Data 5
aw5_x_sm = smoothdata(aw5_x,'gaussian',50);
aw5_y_sm = smoothdata(aw5_y,'gaussian',50);
aw5_z_sm = smoothdata(aw5_z,'gaussian',50);
aw5_abs_sm = smoothdata(aw5_abs,'gaussian',50);

% Walking Data 6
aw6_x_sm = smoothdata(aw6_x,'gaussian',50);
aw6_y_sm = smoothdata(aw6_y,'gaussian',50);
aw6_z_sm = smoothdata(aw6_z,'gaussian',50);
aw6_abs_sm = smoothdata(aw6_abs,'gaussian',50);

% Running Data 1
ar1_x_sm = smoothdata(ar1_x,'gaussian',50);
ar1_y_sm = smoothdata(ar1_y,'gaussian',50);
ar1_z_sm = smoothdata(ar1_z,'gaussian',50);
ar1_abs_sm = smoothdata(ar1_abs,'gaussian',50);

% Running Data 2
ar2_x_sm = smoothdata(ar2_x,'gaussian',50);
ar2_y_sm = smoothdata(ar2_y,'gaussian',50);
ar2_z_sm = smoothdata(ar2_z,'gaussian',50);
ar2_abs_sm = smoothdata(ar2_abs,'gaussian',50);

% Running Data 3
ar3_x_sm = smoothdata(ar3_x,'gaussian',50);
ar3_y_sm = smoothdata(ar3_y,'gaussian',50);
ar3_z_sm = smoothdata(ar3_z,'gaussian',50);
ar3_abs_sm = smoothdata(ar3_abs,'gaussian',50);

% Running Data 4
ar4_x_sm = smoothdata(ar4_x,'gaussian',50);
ar4_y_sm = smoothdata(ar4_y,'gaussian',50);
ar4_z_sm = smoothdata(ar4_z,'gaussian',50);
ar4_abs_sm = smoothdata(ar4_abs,'gaussian',50);

% Running Data 5
ar5_x_sm = smoothdata(ar5_x,'gaussian',50);
ar5_y_sm = smoothdata(ar5_y,'gaussian',50);
ar5_z_sm = smoothdata(ar5_z,'gaussian',50);
ar5_abs_sm = smoothdata(ar5_abs,'gaussian',50);

% Jumping Data 1
aj1_x_sm = smoothdata(aj1_x,'gaussian',50);
aj1_y_sm = smoothdata(aj1_y,'gaussian',50);
aj1_z_sm = smoothdata(aj1_z,'gaussian',50);
aj1_abs_sm = smoothdata(aj1_abs,'gaussian',50);

% Jumping Data 2
aj2_x_sm = smoothdata(aj2_x,'gaussian',50);
aj2_y_sm = smoothdata(aj2_y,'gaussian',50);
aj2_z_sm = smoothdata(aj2_z,'gaussian',50);
aj2_abs_sm = smoothdata(aj2_abs,'gaussian',50);

% Jumping Data 3
aj3_x_sm = smoothdata(aj3_x,'gaussian',50);
aj3_y_sm = smoothdata(aj3_y,'gaussian',50);
aj3_z_sm = smoothdata(aj3_z,'gaussian',50);
aj3_abs_sm = smoothdata(aj3_abs,'gaussian',50);

% Jumping Data 4
aj4_x_sm = smoothdata(aj4_x,'gaussian',50);
aj4_y_sm = smoothdata(aj4_y,'gaussian',50);
aj4_z_sm = smoothdata(aj4_z,'gaussian',50);
aj4_abs_sm = smoothdata(aj4_abs,'gaussian',50);

% Jumping Data 5
aj5_x_sm = smoothdata(aj5_x,'gaussian',50);
aj5_y_sm = smoothdata(aj5_y,'gaussian',50);
aj5_z_sm = smoothdata(aj5_z,'gaussian',50);
aj5_abs_sm = smoothdata(aj5_abs,'gaussian',50);

% Jumping Data 6
aj6_x_sm = smoothdata(aj6_x,'gaussian',50);
aj6_y_sm = smoothdata(aj6_y,'gaussian',50);
aj6_z_sm = smoothdata(aj6_z,'gaussian',50);
aj6_abs_sm = smoothdata(aj6_abs,'gaussian',50);

%% Section 4 : Plot and return peak distances (toggle true/false for plot)
% If want to view plots, set toggle_plot = true on top of data set, and
% uncomment the data set (to prevent long run time)
% WALKING : Call the peak plotter and peak distance return function (Fin.)
toggle_plot = true;

% [w1_x_peakdist,...
%  w1_y_peakdist,...
%  w1_z_peakdist,...
%  w1_abs_peakdist] = xyzabsPeaks(1,'w',tw1,aw1_x_sm,aw1_y_sm,aw1_z_sm,aw1_abs_sm,toggle_plot);
% 
% [w2_x_peakdist,...
%  w2_y_peakdist,...
%  w2_z_peakdist,...
%  w2_abs_peakdist] = xyzabsPeaks(2,'w',tw2,aw2_x_sm,aw2_y_sm,aw2_z_sm,aw2_abs_sm,toggle_plot);
% 
% [w3_x_peakdist,...
%  w3_y_peakdist,...
%  w3_z_peakdist,...
%  w3_abs_peakdist] = xyzabsPeaks(3,'w',tw3,aw3_x_sm,aw3_y_sm,aw3_z_sm,aw3_abs_sm,toggle_plot);
% 
% [w4_x_peakdist,...
%  w4_y_peakdist,...
%  w4_z_peakdist,...
%  w4_abs_peakdist] = xyzabsPeaks(4,'w',tw4,aw4_x_sm,aw4_y_sm,aw4_z_sm,aw4_abs_sm,toggle_plot);
% 
% [w5_x_peakdist,...
%  w5_y_peakdist,...
%  w5_z_peakdist,...
%  w5_abs_peakdist] = xyzabsPeaks(5,'w',tw5,aw5_x_sm,aw5_y_sm,aw5_z_sm,aw5_abs_sm,toggle_plot);
% 
% [w6_x_peakdist,...
%  w6_y_peakdist,...
%  w6_z_peakdist,...
%  w6_abs_peakdist] = xyzabsPeaks(6,'w',tw6,aw6_x_sm,aw6_y_sm,aw6_z_sm,aw6_abs_sm,toggle_plot);

%% RUNNING : Call the peak plotter and peak distance return function (Fin.)

% [r1_x_peakdist,...
%  r1_y_peakdist,...
%  r1_z_peakdist,...
%  r1_abs_peakdist] = xyzabsPeaks(1,'r',tr1,ar1_x_sm,ar1_y_sm,ar1_z_sm,ar1_abs_sm,toggle_plot);
% 
% [r2_x_peakdist,...
%  r2_y_peakdist,...
%  r2_z_peakdist,...
%  r2_abs_peakdist] = xyzabsPeaks(2,'r',tr2,ar2_x_sm,ar2_y_sm,ar2_z_sm,ar2_abs_sm,toggle_plot);
% 
% [r3_x_peakdist,...
%  r3_y_peakdist,...
%  r3_z_peakdist,...
%  r3_abs_peakdist] = xyzabsPeaks(3,'r',tr3,ar3_x_sm,ar3_y_sm,ar3_z_sm,ar3_abs_sm,toggle_plot);
% 
% [r4_x_peakdist,...
%  r4_y_peakdist,...
%  r4_z_peakdist,...
%  r4_abs_peakdist] = xyzabsPeaks(4,'r',tr4,ar4_x_sm,ar4_y_sm,ar4_z_sm,ar4_abs_sm,toggle_plot);
% 
% [r5_x_peakdist,...
%  r5_y_peakdist,...
%  r5_z_peakdist,...
%  r5_abs_peakdist] = xyzabsPeaks(5,'r',tr5,ar5_x_sm,ar5_y_sm,ar5_z_sm,ar5_abs_sm,toggle_plot);

%% JUMPING : Call the peak plotter and peak distance return function (Not Fin.)
[j1_x_peakdist,...
 j1_y_peakdist,...
 j1_z_peakdist,...
 j1_abs_peakdist] = xyzabsPeaks(1,'j',tj1,aj1_x_sm,aj1_y_sm,aj1_z_sm,aj1_abs_sm,toggle_plot);
% 
% [j2_x_peakdist,...
%  j2_y_peakdist,...
%  j2_z_peakdist,...
%  j2_abs_peakdist] = xyzabsPeaks(2,'j',tj2,aj2_x_sm,aj2_y_sm,aj2_z_sm,aj2_abs_sm,toggle_plot);
% 
% [j3_x_peakdist,...
%  j3_y_peakdist,...
%  j3_z_peakdist,...
%  j3_abs_peakdist] = xyzabsPeaks(3,'j',tj3,aj3_x_sm,aj3_y_sm,aj3_z_sm,aj3_abs_sm,toggle_plot);
% 
% [j4_x_peakdist,...
%  j4_y_peakdist,...
%  j4_z_peakdist,...
%  j4_abs_peakdist] = xyzabsPeaks(4,'j',tj4,aj4_x_sm,aj4_y_sm,aj4_z_sm,aj4_abs_sm,toggle_plot);
% 
% [j5_x_peakdist,...
%  j5_y_peakdist,...
%  j5_z_peakdist,...
%  j5_abs_peakdist] = xyzabsPeaks(5,'j',tj5,aj5_x_sm,aj5_y_sm,aj5_z_sm,aj5_abs_sm,toggle_plot);
% 
% [j6_x_peakdist,...
%  j6_y_peakdist,...
%  j6_z_peakdist,...
%  j6_abs_peakdist] = xyzabsPeaks(6,'j',tj6,aj6_x_sm,aj6_y_sm,aj6_z_sm,aj6_abs_sm,toggle_plot);

%% Section 5: Peak (x,y) locations

% All Walking Peak Locations
% [aw1x_pk_x,aw1x_pk_y,...
%     aw1y_pk_x,aw1y_pk_y,...
%     aw1z_pk_x,aw1z_pk_y,...
%     aw1_abs_pk_x,aw1_abs_pk_y] = pkLoc(tw1,aw1_x_sm,aw1_y_sm,aw1_z_sm,aw1_abs_sm);
% 
% [aw2x_pk_x,aw2x_pk_y,...
%     aw2y_pk_x,aw2y_pk_y,...
%     aw2z_pk_x,aw2z_pk_y,...
%     aw2_abs_pk_x,aw2_abs_pk_y] = pkLoc(tw2,aw2_x_sm,aw2_y_sm,aw2_z_sm,aw2_abs_sm);
% 
% [aw3x_pk_x,aw3x_pk_y,...
%     aw3y_pk_x,aw3y_pk_y,...
%     aw3z_pk_x,aw3z_pk_y,...
%     aw3_abs_pk_x,aw3_abs_pk_y] = pkLoc(tw3,aw3_x_sm,aw3_y_sm,aw3_z_sm,aw3_abs_sm);
% 
% [aw4x_pk_x,aw4x_pk_y,...
%     aw4y_pk_x,aw4y_pk_y,...
%     aw4z_pk_x,aw4z_pk_y,...
%     aw4_abs_pk_x,aw4_abs_pk_y] = pkLoc(tw4,aw4_x_sm,aw4_y_sm,aw4_z_sm,aw4_abs_sm);
% 
% [aw5x_pk_x,aw5x_pk_y,...
%     aw5y_pk_x,aw5y_pk_y,...
%     aw5z_pk_x,aw5z_pk_y,...
%     aw5_abs_pk_x,aw5_abs_pk_y] = pkLoc(tw5,aw5_x_sm,aw5_y_sm,aw5_z_sm,aw5_abs_sm);
% 
% [aw6x_pk_x,aw6x_pk_y,...
%     aw6y_pk_x,aw6y_pk_y,...
%     aw6z_pk_x,aw6z_pk_y,...
%     aw6_abs_pk_x,aw6_abs_pk_y] = pkLoc(tw6,aw6_x_sm,aw6_y_sm,aw6_z_sm,aw6_abs_sm);

% All Running Peak Locations
% [ar1x_pk_x,ar1x_pk_y,...
%     ar1y_pk_x,ar1y_pk_y,...
%     ar1z_pk_x,ar1z_pk_y,...
%     ar1_abs_pk_x,ar1_abs_pk_y] = pkLoc(tr1,ar1_x_sm,ar1_y_sm,ar1_z_sm,ar1_abs_sm);
% 
% [ar2x_pk_x,ar2x_pk_y,...
%     ar2y_pk_x,ar2y_pk_y,...
%     ar2z_pk_x,ar2z_pk_y,...
%     ar2_abs_pk_x,ar2_abs_pk_y] = pkLoc(tr2,ar2_x_sm,ar2_y_sm,ar2_z_sm,ar2_abs_sm);
% 
% [ar3x_pk_x,ar3x_pk_y,...
%     ar3y_pk_x,ar3y_pk_y,...
%     ar3z_pk_x,ar3z_pk_y,...
%     ar3_abs_pk_x,ar3_abs_pk_y] = pkLoc(tr3,ar3_x_sm,ar3_y_sm,ar3_z_sm,ar3_abs_sm);
% 
% [ar4x_pk_x,ar4x_pk_y,...
%     ar4y_pk_x,ar4y_pk_y,...
%     ar4z_pk_x,ar4z_pk_y,...
%     ar4_abs_pk_x,ar4_abs_pk_y] = pkLoc(tr4,ar4_x_sm,ar4_y_sm,ar4_z_sm,ar4_abs_sm);
% 
% [ar5x_pk_x,ar5x_pk_y,...
%     ar5y_pk_x,ar5y_pk_y,...
%     ar5z_pk_x,ar5z_pk_y,...
%     ar5_abs_pk_x,ar5_abs_pk_y] = pkLoc(tr5,ar5_x_sm,ar5_y_sm,ar5_z_sm,ar5_abs_sm);
% 
% All Jumping Peak Locations
% [aj1x_pk_x,aj1x_pk_y,...
%     aj1y_pk_x,aj1y_pk_y,...
%     aj1z_pk_x,aj1z_pk_y,...
%     aj1_abs_pk_x,aj1_abs_pk_y] = pkLoc(tj1,aj1_x_sm,aj1_y_sm,aj1_z_sm,aj1_abs_sm);
% 
% [aj2x_pk_x,aj2x_pk_y,...
%     aj2y_pk_x,aj2y_pk_y,...
%     aj2z_pk_x,aj2z_pk_y,...
%     aj2_abs_pk_x,aj2_abs_pk_y] = pkLoc(tj2,aj2_x_sm,aj2_y_sm,aj2_z_sm,aj2_abs_sm);
% 
% [aj3x_pk_x,aj3x_pk_y,...
%     aj3y_pk_x,aj3y_pk_y,...
%     aj3z_pk_x,aj3z_pk_y,...
%     aj3_abs_pk_x,aj3_abs_pk_y] = pkLoc(tj3,aj3_x_sm,aj3_y_sm,aj3_z_sm,aj3_abs_sm);
% 
% [aj4x_pk_x,aj4x_pk_y,...
%     aj4y_pk_x,aj4y_pk_y,...
%     aj4z_pk_x,aj4z_pk_y,...
%     aj4_abs_pk_x,aj4_abs_pk_y] = pkLoc(tj4,aj4_x_sm,aj4_y_sm,aj4_z_sm,aj4_abs_sm);
% 
% [aj5x_pk_x,aj5x_pk_y,...
%     aj5y_pk_x,aj5y_pk_y,...
%     aj5z_pk_x,aj5z_pk_y,...
%     aj5_abs_pk_x,aj5_abs_pk_y] = pkLoc(tj5,aj5_x_sm,aj5_y_sm,aj5_z_sm,aj5_abs_sm);
% 
% [aj6x_pk_x,aj6x_pk_y,...
%     aj6y_pk_x,aj6y_pk_y,...
%     aj6z_pk_x,aj6z_pk_y,...
%     aj6_abs_pk_x,aj6_abs_pk_y] = pkLoc(tj6,aj6_x_sm,aj6_y_sm,aj6_z_sm,aj6_abs_sm);

%% Find the distance between the peaks for the peak positions
% This is an example of Gaussian smoothing effect on noise & outliers
% figure();
% plot(tw5,aw5_abs,'w');
% hold on;
% plot(0.45,39.5868,'ro','MarkerSize',18,'LineWidth',3);
% xlabel('Time [sec]'); ylabel('Acceleration [m/s^2]');
% title('Absolute Acceleration [m/s^2] for Raw Data Set');
% lgd = legend('Raw Acceleration','Extreme Outlier','Location','northeast');
% set(gca,'color',[0 0 0]);
% set(lgd,'Box','off');
% lgd.TextColor = 'white';
% xlim([0 15]);
% % hold on;
% % [y_loc,x_loc,width] = gaussfit(tr2,ar2_abs);
% 
% figure();
% plot(tw5,aw5_abs_sm,'w');
% hold on;
% plot(0.45,15.5868,'ro','MarkerSize',18,'LineWidth',3);
% xlabel('Time [sec]'); ylabel('Acceleration [m/s^2]');
% title('Absolute Acceleration [m/s^2] for Smoothed Data Set');
% lgd = legend('Smoothed Acceleration','Moderated Outlier','Location','northeast');
% set(gca,'color',[0 0 0]);
% set(lgd,'Box','off');
% lgd.TextColor = 'white';
% xlim([0 15]);


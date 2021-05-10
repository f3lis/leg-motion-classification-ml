function [x_pk_x,x_pk_y,y_pk_x,y_pk_y,z_pk_x,z_pk_y,abs_pk_x,abs_pk_y] = pkLoc(t,a_x_sm,a_y_sm,a_z_sm,a_abs_sm)

slope_thr = 0; 
amp_thr = -10;
sm_width = 1;
pk_grp = 1;

% Find peaks of x acceleration
P_x = findpeaksG(t,a_x_sm,...
    slope_thr,amp_thr,sm_width,pk_grp);
x_pk_x = P_x(:,2); %Posn of peaks
x_pk_y = P_x(:,3);

% Find peaks of y acceleration
P_y = findpeaksG(t,a_y_sm,...
    slope_thr,amp_thr,sm_width,pk_grp);
y_pk_x = P_y(:,2); %Posn of peaks
y_pk_y = P_y(:,3);

% Find peaks of z acceleration
P_z = findpeaksG(t,a_z_sm,...
    slope_thr,amp_thr,sm_width,pk_grp);
z_pk_x = P_z(:,2); %Posn of peaks
z_pk_y = P_z(:,3);

% Find peaks of absolute acceleration
P_abs = findpeaksG(t,a_abs_sm,...
    slope_thr,amp_thr,sm_width,pk_grp);
abs_pk_x = P_abs(:,2); %Posn of peaks
abs_pk_y = P_abs(:,3);

end


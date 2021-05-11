function [plt,plt_pk,pltstem] = plotPeaks(t,acc_sm,pk_x,pk_y,delta_shift,acc_dirn)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
figure();
plt = plot(t,acc_sm,'w','LineWidth',2);
hold on;
plt_pk = plot(pk_x + delta_shift,pk_y,'rv',...
    'MarkerSize',8,'MarkerFaceColor','r');
pltstem = stem((pk_x+delta_shift),pk_y,'r','marker','none');
xlim([0 15]); ylim([min(acc_sm) max(acc_sm)+4.5]);
titlestr = strcat(acc_dirn,' Acceleration [m/s^2]');
title(titlestr);
xlabel('Time [sec]'); ylabel('Acceleration [m/s^2]');
lgd = legend(acc_dirn,'Peaks','Location','northwest');
set(gca,'color',[0 0 0]);
set(lgd,'Box','off');
lgd.TextColor = 'white';
end


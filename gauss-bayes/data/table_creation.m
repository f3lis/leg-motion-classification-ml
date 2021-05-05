function [awalkingdata] = table_creation(file,mode)
%takes in excel file and creates table with mode column
aw_data=readmatrix(file);
awa_x = aw_data(:,2);
awa_y = aw_data(:,3);
awa_z = aw_data(:,4);
awa_abs = aw_data(:,5);
classaw = repmat(mode,[1 length(awa_z)]);
classaw = classaw(:);

%smooth data
awa_x = smooth_filter(awa_x);
awa_y = smooth_filter(awa_y);
awa_z = smooth_filter(awa_z);
awa_abs = smooth_filter(awa_abs);

awalkingdata=table(awa_x,awa_y,awa_z,awa_abs,classaw);
awalkingdata.Properties.VariableNames = ["A_x","A_y","A_z","A_abs","Motion"];

end


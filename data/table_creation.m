function [awalkingdata] = table_creation(file,mode)
%takes in excel file and creates table with mode column
aw_data=readmatrix(file);
awtime = aw_data(:,1);
awa_x = aw_data(:,2);
awa_y = aw_data(:,3);
awa_z = aw_data(:,4);
awa_abs = aw_data(:,5);
classaw = repmat(mode,[1 length(awa_z)]);
classaw = classaw(:);
awalkingdata=table(awtime,awa_x,awa_y,awa_z,awa_abs,classaw);
awalkingdata.Properties.VariableNames = ["time","A_x","A_y","A_z","A_abs","Motion"];

end


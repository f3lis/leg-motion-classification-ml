function Pk_lst=findLocalPeaks(x,y,SlopeThreshold,AmpThreshold,smoothwidth,peakgroup,smoothtype)
% Function to locate the positive peaks in a noisy data
% Input: slope threshold, amplitude threshold, width of smooth data,
% peakgroup: # points at top taken to measure, smoothwidth: more smoothing
% Output: pk_lst containing peak number and position,
if nargin~=7;smoothtype=1;end  % smoothtype=1 if not specified in argument
if smoothtype>3;smoothtype=3;end
if smoothtype<1;smoothtype=1;end
if smoothwidth<1;smoothwidth=1;end
smoothwidth=round(smoothwidth);
peakgroup=round(peakgroup);
if smoothwidth>1
    d=fastsmooth(deriv(y),smoothwidth,smoothtype);
else
    d=deriv(y);
end
n=round(peakgroup/2+1);
Pk_lst=[0 0 0 0 0];
vectorlength=length(y);
peak=1;
for j=2*round(smoothwidth/2)-1:length(y)-smoothwidth-1
    % Detects zero-crossing
    if sign(d(j)) > sign(d(j+1)) 
        % if slope of derivative is larger than SlopeThreshold
        if d(j)-d(j+1) > SlopeThreshold 
            % if height of peak is larger than AmpThreshold
            if y(j) > AmpThreshold 
                xx=zeros(size(peakgroup));yy=zeros(size(peakgroup));
                % Create sub-group of points near peak
                for k=1:peakgroup 
                    groupindex = j+k-n+2;
                    if groupindex<1, groupindex=1;end
                    if groupindex>vectorlength, groupindex=vectorlength;end
                    xx(k)=x(groupindex);yy(k)=y(groupindex);
                end
                if peakgroup>=1
                    % Compute peak position and height of fitted parabola
                    [y_loc,x_loc,width]=gaussfit(xx,yy);
                    PeakX = real(x_loc);   
                    if y_loc>max(yy) || y_loc<max(yy)
                        PeakY=max(yy);
                    else
                        PeakY=real(y_loc);
                    end 
                    MeasuredWidth=real(width);
                    % if the peak is too narrow for least-squares 
                    % technique to work use the max value of y 
                    % in sub-group of points near peak
                else
                    PeakY=max(yy);
                    pindex=val2ind(yy,PeakY);
                    PeakX=xx(pindex(1));
                    MeasuredWidth=0;
                end
                % Append to matrix Pk_lst
                % peak number,(x-value), (y-value) of peaks
                if isnan(PeakX) || isnan(PeakY) || PeakY<AmpThreshold
                    continue
                else % Otherwise count this as a valid peak
                    Pk_lst(peak,:) = [round(peak) PeakX PeakY ...
                        MeasuredWidth  1.0646.*PeakY*MeasuredWidth];
                    peak=peak+1; % Move on to next peak 
                end
            end
        end
    end
end
% ----------------------------------------------------------------------
function [index,closestval]=val2ind(x,val)
% Returns the index and the value of the element of vector x closest to val
dif=abs(x-val);
index=find((dif-min(dif))==0);
closestval=x(index);

function d = deriv(a)
% Function: first derivative of vector using 2-point central difference.
n=length(a);
d=zeros(size(a));
d(1)=a(2)-a(1);
d(n)=a(n)-a(n-1);
for j = 2:n-1
    d(j)=(a(j+1)-a(j-1)) ./ 2;
end

function SmoothY = fastsmooth(Y,w,type,ends)
% fastbsmooth(Y,w,type,ends) smooths vector Y with smooth
%  of width w.
% The argument "type" determines the smooth type:
%   If type=1, rectangular (sliding-average or boxcar)
%   If type=2, triangular (2 passes of sliding-average)
%   If type=3, pseudo-Gaussian (3 passes of sliding-average)
% The argument "ends" controls how the "ends" of the signal
% (the first w/2 points and the last w/2 points) are handled.
%   If ends=0, the ends are zero.  (In this mode the elapsed
%     time is independent of the smooth width). The fastest.
%   If ends=1, the ends are smoothed with progressively
%     smaller smooths the closer to the end. (In this mode the
%     elapsed time increases with increasing smooth widths).
if nargin==2, ends=0; type=1; end
if nargin==3, ends=0; end
switch type
    case 1
        SmoothY=sa(Y,w,ends);
    case 2
        SmoothY=sa(sa(Y,w,ends),w,ends);
    case 3
        SmoothY=sa(sa(sa(Y,w,ends),w,ends),w,ends);
end

function SmoothY=sa(Y,smoothwidth,ends)
% smooth
w=round(smoothwidth);
SumPoints=sum(Y(1:w));
s=zeros(size(Y));
halfw=round(w/2);
L=length(Y);
for k=1:L-w
    s(k+halfw-1)=SumPoints;
    SumPoints=SumPoints-Y(k);
    SumPoints=SumPoints+Y(k+w);
end
s(k+halfw)=sum(Y(L-w+1:L));
SmoothY=s./w;
% Taper the ends of the signal if ends=1.
if ends==1
    startpoint=(smoothwidth + 1)/2;
    SmoothY(1)=(Y(1)+Y(2))./2;
    for k=2:startpoint
        SmoothY(k)=mean(Y(1:(2*k-1)));
        SmoothY(L-k+1)=mean(Y(L-2*k+2:L));
    end
    SmoothY(L)=(Y(L)+Y(L-1))./2;
end

% Reference: (toh@umd.edu), Tom O'Haver. Peak Finding and Measurement,
% terpconnect.umd.edu/~toh/spectrum/PeakFindingandMeasurement.htm.

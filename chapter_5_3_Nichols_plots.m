% Chapter 5 - Frequency Response Anaysis 
% Section 3 : Log-Magnitude VS Phase Plots (AKA Nichols plots)
clear all
clc

% Notes on Nichols Plots

% The two curves of a Bode plot are combined into one. This plot can easily
% be constructed by reading values of the log magnitude and phase angle
% from the Bode diagram. 
%
% Advantages: Relative stability of the closed-loop system can be
% determined quickly and compensation can be worked out easily. Also, can
% easily show the resonance frequencies of the system. Both constant mag
% and constant phase can be used to determine the closed-loop frequency
% response from the open-loop transfer function. 
% 
% Constant Magnitude Loci (M circles) : G(jw) = X +jY
%    - Determine where M = 1 and draw a vertical line at -1/2. This point
%    is equidistance from the origin to -1. 
%    - When M does not equal 1, the center and radius of the circle for a
%    given value of M can be easily calculated. 
%    - The larger M, the smaller the M circle becomes. For 0 < M < 1, the
%    circles lie to the right of the origin
%
% Constant Phase - Angle Loci (N circles/arcs) : e ^ (ja), where tan(a) = N
%    - The equations of the circle/arc are: X = -1/2 , Y = 1/(2N), with a
%    radius at r = sqrt( 1/4 + 1/(2N)^2)
%    - Each circle passes through the [ -1 + j0 ] point. 
%
% Using the M and N circles, we can find the entire closed - loop frequency
% response from the open-loop , G(jw), w/o calculating the mag and phase of
% the closed-loop TF at each frequency. The intersections of M and N
% circles gives the value of Mag and Phase on the G(jw) locus. 
% 
% Together they create the Nichols chart. (axes are dB and deg). This chart
% is symmetric about -180 deg. The M and N loci repeat every 360 deg. The M
% loci are centered around the critical point (0 dB, -180 deg). If the
% open-loop frequency response curve is superimposed on the Nichols chart,
% the interections of the OL, G(jw), are the closed loop responses. The
% resonance frequency is given by the frequency at the point of tangency. 

%% 5-16 Draw the nichols plot of G(s) 

num = [80];
den = [1 14 40 0];
w = logspace(-1, 1, 100);

figure
nichols(num, den, w);
ngrid;
title('Example5-16 : Nichols Plot of TF')
text(-160, -18, 'G(j\omega) locus')

%% 5-17 Unity Feedback CS with OL TF 
clear all
clc

num = [100];
den = [1 7.5 0];
w = logspace(0, 2, 10);

[mag, ph, w] = nichols(num, den, w);
magdB = 20 * log10(mag);

figure;
plot(ph, magdB, '-o'), ngrid
v = [-250 0 -60 40]; axis(v)
title('Example5-17a : Nichols Plot of Open Loop TF w/ \omega Values')
xlabel('Open Loop Phase [deg]')
ylabel('Open Loop Mag [deg]')
text(-90, 22, '\omega = 1')
text(-170, -41, '\omega = 100')
% Notice that the graph is tangent aroung 3-dB curve and w = 8 rad/sec. 
% This means that the CL TF has a maximum mag at this location. Lets double
% check with a Bode diagram 

Gs = tf([num], [den]);
sys = feedback(Gs, 1);
ww = logspace(0, 2, 100);
figure; bode(sys, ww), grid;
title('Example5-17b: Bode Plot to Verify Closed Loop Maxima'

%% 5-18 Use Nichols to plot Open Loop TF, and verify with Bode Plot
clear; clc
% Open Loop TF 

num = [45 20 1];
den = [1 10 20 30 5 0];
w = logspace(-3, 2, 300);
ww = [1, 3, 10, 100];

figure; 
nichols(num, den, w), ngrid
title('Example5-18a : Nichols Plot of Open Loop TF')
hold on
[mag, ph, ww] = nichols(num, den, ww);
magdB = 20 * log10(mag);

plot(ph, magdB, 'o')
gtext('1'); gtext('3'); gtext('10'); gtext('100');
hold off

% Determine Closed loop Bode Plot to verify 
Gs = tf([num], [den]);
sys = feedback(Gs, 1);
figure
bode(sys,w), grid
title('Example5-18b : Bode Plot of Closed Loop System')

% Note that the OL TF in the Nichols chart has a tangent around 6 dB and 3
% rad/sec. This corresponds to the peak in the magnitude of the Bode plot. 


















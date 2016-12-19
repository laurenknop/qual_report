% Chapter 5 - Frequency Response Anaysis 
% Section 2 : Plotting Nyquist Diagrams with Matlab
clear all
clc

% Notes on Nyquist plots: 

% Nyquist plots are typically used in the frequency-response
% respresentation of linear time-invariant feedback control systems. They
% are polar plots (Bode = rectangular). Nyquist plots magnitude vs the
% phase angle on polar coordinates as w is varied from 0 to inf, resulting
% in a locus of vectors as w is varied from 0 to inf. 

% Positive phase angle = CCW 
% Negative phase angle = CW 

% Nyquist Stability Criterion: Open Loop TF (G(s)H(s)) 
%   1. Z = N + P 
%       Z = # zeros of characteristic equation [ 1 + G(s)H(s) ] in RHP
%       N = # CW encirclements of the [ -1 + j0 ] point (-1 on REAL axis) 
%       P = # poles of G(s)H(s) in the RHP
%
%       * If P > 0, Then N = -P and Z = 0 to be stable
%       ** If P = 0, Then N = Z (no encirclements) to be stable 
%
%   2. Multi-loop systems may include poles in the RHP ==> (even though an
%   inner loop may be unstalbe, the entire closed-loop system can be made
%   stable by proper design). Number of encirclements, N, is not sufficient
%   to detect instability. Instead, apply Routh Criterion to the
%   characteristic equation [ 1 + G(s)H(s) ] to determine stability. 
% 
%   3. If the locus of G(s)H(s) passes through [ -1 + j0 ] point, then
%   zeros of the characteristic equation, are located on the jw-axis. This
%   is not desirable for practical control systems. 
% 
% 
% More on stablility : 
%   System is stable if: 
%       1. There are no encirclements of [ -1 + j0 ] and no poles of
%           G(s)H(s) in the RHP. 
%       2. There are 1 or more CCW encirclements of [ -1 + j0 ] and the #
%           of CCW (N) is equal to the # of poles of G(s)H(s) in the RHP. 
%           -N = P
%       3. There are 1 or  more CW encirclements of [ -1 + j0 ]...this
%           system is UNSTABLE
%% 5-7 Draw a Nyquist plot
% Open loop TF: G(s) = 1/ (s^2 + 0.8s + 1)

num = [1];
den = [1 0.8 1];

% Manually set ranges
v = [-2 2 -2 2];

figure
nyquist(num, den), axis(v)
title('Example5-7 : Nyquist Plot of G(s) = 1/ (s^2 + 0.8s + 1)')

%% 5-8 See what happens if a TF divides by zero 
num2 = [1];
den2 = [1 1 0];
v2 = [-2 2 -5 5];

figure 
nyquist(num2, den2), axis(v2)
title('Example5-8 : Nyquist plot of G(s) = 1/ (s(s+1))')

%% 5-9 Nyquist plot with State Space 





































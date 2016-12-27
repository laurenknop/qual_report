% Chapter 6 - State Space Design of Control Systems 
% Section 3 - Pole Placement / Pole Placement Technique

% Notes
% Assume all state variables are measurable and are available for feedback.
% If the system is completely state controllable, then poles of the
% closed-loop system may be placed at any desired locations by means of
% state feedback through an appropriate state feedback gain matrix. By
% choosing the correct gain, you can force system to have closed-loop poles
% at any desired location. 
% 
% For this section, we are only looking at Single-Input-Single-Output
% systems. With vector quantities = state feedback gain is not unique. 
%
% DESIGN BY POLE PLACEMENT : In the conventional approach, we design a
% controller to the dominant closed-loop poles have a desired damping
% ratio, zeta, and an undamped natural frequency, wn. This method only
% specifies dominant poles.....assume nondominant closed-loop poles are
% negligible. 
% The pole-placement approach specifies all closed-loop poles. The system
% is required to be completely state controllable, so that the closed-loop
% poles are places at arbitrarily chose locations? 

% Use state feedback gain: u = -Kx

%%% Insert block diagram for matlab live version!!!! Page 314 --> This
%%% system is a "regulator system". It has not input and tries to remain at
%%% zero, but deviates if there is a disturbance. 

% Ackerman's Formula ? 


%% 6-3 Determine the state feedback gain matrix, K
% Given a regulator system and state feedback control. Choose the desired
% closed-loop poles at specified locations. 

% Given : 
A = [0 1 0; 0 0 1; -1, -5, -6];
B = [0; 0; 1];

% 1) Check controllability matrix of the system based on A and B. 

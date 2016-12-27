% Chapter 6 - State Space Design of Control Systems 
%% Section 1 - Introduction 

% Notes
% Use MATLAB to check the controllability and observability conditions of
% ANY linear, time-invarient systems. Also useful for designing ovservers
% and observer controllers. 

%% Section 2 - Controllability and Observability

% A system is controllable at time, t0, if it is possible to transfer the
% system from any initial state x(t0) to any other state in a finite
% interval of time by means of an unconstrained control vector. A system is
% said to be "state controllable" at t = t0 if it is possible to construct an
% unconstrained control signal that will transfer an initial state to any
% final state in a finite time interval t0 < t < t1. If every state is
% controllable, the system is "completely state controllable". The goal
% from determining A and B matrices is to determine the "controllability
% matrix"
% 
% A system is observable at time, t0, if it is possible to determine the
% state x(t0) of the system from the observation of the output over a
% finite time interval (such as by a sensor). The system is completely
% observable if every transition of the state eventually affects every
% element of the output vector, assumint t0 = 0. The concept of
% observability is very important bc there is difficulty with some state
% variables are not accessible for direct measurement. 
% 
% Both controllability and observability were introduced by Kalman. These
% may govern the existence of a complete solution to the control system
% design problem. 
% 
% Detectability : the system is said to be detectable if a partially
% observable system has unobservable modes that are stable and observable
% modes that are unstable. Dual to the concept of stabilizability. 
%
% MATLAB COMMANDS : ctrb for controllability matrix & obsb for
% obeservability matrix for the A, B, C, and D matrices. 
% Can use the command minreal(sys) to determine if tf is simplified. 

%% 6-1 Examine the controllability and observability of the system 
clear all
clc

% x_dot = Ax + Bu
% y = Cx

%define system matrices
A = [ 0 1 0; 0 0 1; -6 -11 -6];
B = [0; 0; 1];
C = [5 6 1];
D = [0];

%controlability matrix
CONT = ctrb(A,B) 
rank_cont = rank(CONT)
OBSER = obsv(A, C)
rank_obsv = rank(OBSER)
    % this system is controllable, but not observable bc the observable
    % rank is equal to 2, which is less than n (order of the system) 
    % This suggests that there is a cancelation of terms in the numerator
    % of denominator of the TF. 
    
% determine tf
[num, den] = ss2tf(A, B, C, D);
disp('Transfer Function : ')
sys = tf(num, den) 
disp('Simplified Transfer Function : ') 
sys_min = minreal(sys)
    % There is an (s + 1) term in the numerator and denominator of the tf
    % that need to be canceled out in order for the rank to equal 3 for the
    % observable state. 

    
%% 6-2 New state matrices to determine controlability/observability

A2 = [ 1 0; 0 -1];
B2 = [1; 0];
C2 = [1 1];
D2 = [0];

CONT2 = ctrb(A,B);
    if rank(CONT2) == size(A)
        disp('The system is controllable')
    else
        if rank(CONT2) == 0
            disp('The system is uncontrollable')
    else  
            disp('They system may be stabilizable (AKA simplify TF)')
        end
    end
    
OBSER2 = obsv(A, C) 
     if rank(OBSER2) == size(A)
        disp('The system is observable')
    else
        if rank(OBSER2) == 0
            disp('The system is observable')
    else  
            disp('They system may be detectable ?')
        end
    end   






















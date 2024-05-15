%% Mono-objective optimization for the Fixed Charge Transportation Problem
% ------------------------------------------------------------------------
% Institution:  Polytechnic University of Bari
% Degree:       Master's Degree in Automation Engineering
% Course:       Optimization and Control
% Authors:      Brandi Giuseppe, Daloiso Luca
% ------------------------------------------------------------------------

% Clear environment
clc, clearvars, close all

% Coefficient vector
f = objectivecost();

% Integer constraints
intcon = 13:24;

% Inequality constraints
[A,b] = ineqconstraints();

% Equality constraints
[Aeq,beq] = eqconstraints();

% Lower bounds for decision variables
lb = [zeros(12,1), zeros(12,1)];

% Upper bounds for decision variables
ub = [inf(12,1), ones(12,1)];

% Optimal solution
[x,fval,exitflag,output] = intlinprog(f,intcon,A,b,Aeq,beq,lb,ub);
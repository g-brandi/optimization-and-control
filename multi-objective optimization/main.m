%% Multi-objective optimization for the Fixed Charge Transportation Problem
% ------------------------------------------------------------------------
% Institution:  Polytechnic University of Bari
% Degree:       Master's Degree in Automation Engineering
% Course:       Optimization and Control
% Authors:      Brandi Giuseppe, Daloiso Luca
% ------------------------------------------------------------------------

% Clear environment
clc, clearvars, close all

% Number of decision variables
nvars = 24;

% Lower bounds for decision variables
lb = [zeros(12,1), zeros(12,1)];

% Upper bounds for decision variables
ub = [inf(12,1), ones(12,1)];

% Inequality constraints
[A,b] = ineqconstraints();

% Equality constraints
[Aeq,beq] = eqconstraints();

% Integer constraints
intcon = 13:24;

% Objective function
fun = @(x)objectivefcn(x);

% Set of points on the Pareto front
[x,fval] = gamultiobj(fun,nvars,A,b,Aeq,beq,lb,ub,[],intcon);

% Plot of the Pareto front
figure,
scatter3(fval(:,1),fval(:,2),fval(:,3),'*'),
title("Pareto front"), grid on,
xlabel('Objective 1'),
ylabel('Objective 2'),
zlabel('Objective 3');
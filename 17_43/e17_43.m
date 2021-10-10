% Intuitive Probability and Random Processes Using MatLab - Steven M. Kay
% Exercise 17.43: In this problem we support the results of Problem 17.18
% by using a computer simulation. Specifically, generate M = 10.000 
% realizations of the AR random process X[n] = 0.95X[n — 1] + U[n] for 
% n = 0,1,... , 49, where U[n] is WGN with σ^2_U = 1. Do so two ways: for 
% the first set of realizations let X[-1] = 0 and for the second set of 
% realizations let X[-1] ~ Ν(0, σ^2_U/(1-a^2)), using a different random 
% variable for each realization. Now estimate the variance for each sample 
% time n, which is r_X[0], by averaging X^2[n] down the ensemble of
% realizations. 
% Do you obtain the theoretical result of r_X[0] = σ^2_U/(1-a^2)?

clear;
% Setting the value of n
n=50;
% Setting the number of realizations
M=10000;
% Setting the value of a
a=0.95;
% Setting the variance of U
varU=1;
% Calculating the variance of X
varX=varU/(1-a^2);
% Turning varX into a nx1 array in order to plot it as a line
var_real=varX*ones(n,1);
% Initializing the two sets of realizations
% x_1 is for X[-1] = 0
x_1=zeros(n,M);
% x_2 is for X[-1] ~ N(0,σ^{2}_{U}/(1-a^2))
x_2=zeros(n,M);
for i=1:n
    for j=1:M
        % Initialziing the first element of each column of x_2. x_1
        % elements are already set to 0
        if i==1
            x_2(i,j)=sqrt(varX)*randn(1,1);
        % Calculating the remaining elements of each column for the two
        % sets
        else
            x_1(i,j)=a*x_1(i-1,j)+sqrt(varU)*randn(1,1);
            x_2(i,j)=a*x_2(i-1,j)+sqrt(varU)*randn(1,1);
        end
    end
end
% Initializing the variance estimations for x_1 and x_2
var_1=zeros(n,1);
var_2=zeros(n,1);
% Calculating the variance estimations of x_1 and x_2 for each row
for i=1:n
    var_1(i,1)=(x_1(i,:)*x_1(i,:)')/M;
    var_2(i,1)=(x_2(i,:)*x_2(i,:)')/M;
end
% Plotting the results
subplot(3,1,1),plot((0:n-1)', var_real'),
grid,axis([0 n 0 12]),title('Real variance')
subplot(3,1,2),plot((0:n-1)', var_1'),
grid,axis([0 n 0 12]),title('Variance estimation for X[-1]=0')
subplot(3,1,3),plot((0:n-1)', var_2')
grid,axis([0 n 0 12])
title('Variance estimation for X[-1] ~ N(0,σ^{2}_{U}/(1-a^2))')

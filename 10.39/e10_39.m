% Intuitive Probability and Random Processes Using MatLab - Steven M. Kay
% Exercise 10.39: If Y = exp(X), where X ~ U(0, 1), find the PDF of Y.
% Next, generate realizations of X on a computer and transform them
% according to exp(X) to yield the realizations of Y. Plot the x's and y's
% in a similar manner to that shown in Figure 10.22 and discuss your
% results.

% Setting the nubmer of realizations as 50.
clear
clf
M=50;
% Generating a Mx1 array of random numbers from 0 to 1.
X=rand(M,1);
Y=exp(X);
% Creating an array for X and Y where the first row consists of zeros 
% and the second one consists of their values.
% This way X and Y will be displayed on top of each axis, so that
% the plot looks simialar to that of Figure 10.22.
X_on_axis=[zeros(M,1);X];
Y_on_axis=[Y;zeros(M,1)];
% Plotting X and Y on top of each axis.
plot(X_on_axis,Y_on_axis,'.');
xlabel('x');
ylabel('y');
% Displaying the line of the exp function for:
% R_X = [0,1] and R_Y = [1,e] = [e^0,e^1] = [1,e].
x_in_exp=(0:0.01:1)';
y_in_exp=exp(x_in_exp);
line(x_in_exp,y_in_exp)
text(0.2,2.3,'Y = exp(X)->');
% Setting the axes limits to be from 0 to e.
axis([0 exp(1) 0 exp(1)])
% Shaping the plot into a square.
axis('square')
grid
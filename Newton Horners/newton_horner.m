%Newton with horners algorithm
%INPUTS: a0,a1,a2,...,an , x0 , E, N
clear
% Get User Input
prompt = "What is the file name of your test case?";

% Stores the name of the txt file
txtFile = input(prompt, "s");

% Opens the txt file
openFile = fopen(txtFile); 

% Gets all the necessary stuff from the txt file
%variables = fscanf(openFile,'%f');
variables = fscanf(openFile,'%f');

% Closes the file
fclose(openFile);

list = []; %list of coefficients of polynomial
degree = variables(1)
n = degree + 1; %number of coefficients in polynomial

%Adds input coefficients to an array
for i=2:(n+1)
    temp = variables(i)
    list = [list, temp];
end

x0 = variables(end-2)
E = variables(end-1) %error tolerance
N = variables(end) %max number of inputs
e = 100; %current error
i = 0; %counter for iterations

%Calculates the Newton's formula until the error value exceeds the error
%tolerance or until number of iterations exceeds the max limit
while e > E && i <= N
    horner_result = horner_helper(list,x0); %result of horners algorithm
    fx0 = horner_result(1);
    fx0_prime = horner_result(2);
    x1 = x0 - (fx0)/(fx0_prime);
    i = i + 1;
    e = abs(x1 - x0);
    x0 = x1;
end

%Prints the final value if the number of iterations is below or equal to
%the max limit. Otherwise print an error message
if i <= N
    fprintf("Final val: %f\n", x1)
else
    fprintf("Error: no solution found\n")
end
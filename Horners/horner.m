%Horners Algorithm
%INPUTS: a0,a1,a2,...,an , x0
clear
% Get User Input
prompt = "What is the file name of your test case?";

% Stores the name of the txt file
txtFile = input(prompt, "s");

% Opens the txt file
openFile = fopen(txtFile); 

% Gets all the necessary stuff from the txt file
variables = fscanf(openFile,'%f'); 

% Closes the file
fclose(openFile);

list = []; %list of coefficients of polynomial
degree = variables(1);
n = degree + 1; %number of coefficients in polynomial

%Adds input coefficients to an array
for i=2:(n+1)
    temp = variables(i);
    list = [list, temp];
end

x0 = variables(end);
temp = list(n); %coefficient of the number with highest degree
result = []; %array for final result

%Adds temp to the result array n times
for i = 1:n
    result = [result, temp];
end

%Go through the result array and use the previous values in the array to
%calculate for the multiple derivative values
for i=n-1:-1:1
    temp = temp * x0 + list(i);
    result(1) = temp;
    for j=2:i
        result(j) = result(j) * x0 + result(j-1);
    end
end

%Print out values for multiple derivatives
factorial_iteration = 0; %iteration for the factorial
for i = 1:length(result)
    fprintf("Result %d: %f\n", i, result(i) * factorial(factorial_iteration));
    factorial_iteration = factorial_iteration + 1;
end
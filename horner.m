%Horners Algorithm
%INPUTS: a0,a1,a2,...,an , x0
clear
list = []; %list of coefficients of polynomial
degree = input("Input polynomial degree:\n");
fprintf("Input coefficients:\n");
n = degree + 1; %number of coefficients in polynomial

%Adds input coefficients to an array
for i=1:n
    temp = input("");
    list = [list, temp];
end

x0 = input("Input x0:\n");
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
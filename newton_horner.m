%Newton with horners algorithm
clear all
list = [] %list of coefficients of polynomial
degree = input("Input polynomial degree:\n")
fprintf("Input coefficients:\n");
n = degree + 1 %number of coefficients in polynomial
for i=1:n
    temp = input("")
    list = [list, temp]
end
x0 = input("Input x0:\n")
temp = list(n)
E = input("Input error tolerance:\n") %error tolerance
N = input("Input max number\n") %max number of inputs
e = 100 %current error
i = 0 %counter for iterations

while e > E | i < N
    horner_result = horner_helper(list,x0) %result of horners algorithm
    fx0 = horner_result(1) %value of f(x0)
    fx0_prime = horner_result(2) %value of f(x0)'
    x1 = x0 - (fx0)/(fx0_prime) %value of 
    i = i + 1
    e = abs(x1 - x0)
    x0 = x1
end

if i <= N
    fprintf("Final val: %f\n", x1)
else
    fprintf("Error: no solution found\n")
end
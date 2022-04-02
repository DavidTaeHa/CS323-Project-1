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

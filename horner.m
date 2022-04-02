%Horners Algorithm
%INPUTS: a0,a1,a2,...,an , x0
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
result = []
for i = 1:n
    result = [result, temp]
end
for i=n-1:-1:1
    temp = temp * x0 + list(i)
    result(1) = temp
    for j=2:i
        result(j) = result(j) * x0 + result(j-1)
    end
end
result(end) = []
for i = 1:length(result)
    fprintf("Result %d: %d\n", i, result(i))
end
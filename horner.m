%Horners Algorithm
%INPUTS: a0,a1,a2,...,an , x0
clear all
list = []
degree = input("Input polynomial degree:\n")
x0 = input("Input x0:\n")
fprintf("Input coefficients:\n");
n = degree + 1
for i=1:n
    temp = input("")
    list = [list, temp]
end
a = list(n)
b = list(n)
for i=n-1:-1:1
    a = a * x0 + list(i)
    if i > 1
        b = b * x0 + a
    end
end
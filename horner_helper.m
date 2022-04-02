%horners helper method for the newton_horner program
function x= horner_helper(valList, x0val)
a = valList(end);
b = valList(end);
x0 = x0val;
for i = length(valList)-1:-1:1
    a = a*x0 + valList(i);
    if i > 1
        b = b*x0 + a;
    end
end
x = [a,b];
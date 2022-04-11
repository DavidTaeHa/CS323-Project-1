function evalPol = Neville_helper(T)
% Implement Neville's algorithm to evaluate interpolation polynomial at x0
% Input:
%   x0  - interpolation point
%   T - input
% Output:
%   evalPol - data at interpolation point
x0 = T(end);
n = T(1);
x = T(2:2:2*n+2);
y = T(3:2:2*n+3);

nCol = length(x0);
nRow = length(x);

% P = zeros(nRow, nCol);
P = repmat(y, 1, nCol); % initialize P

for icol = 1:nRow - 1
    for irow = 1: (nRow - icol) % 
        x1 = x(irow); 
        x2 = x(irow + icol);
        P(irow, :) = ( (x2 - x0).*P(irow, :) + (x0 - x1 ).*P(irow+1, :) )./( x2 - x1 );
    end% for
end% for
evalPol = P(1,:);
end


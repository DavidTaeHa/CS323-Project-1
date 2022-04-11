function [x,detA,detAn,A,b] = cramer(T)
%CRAMER
%   T input
if isrow(T)
    T = T';
end
n = T(1);   % size of matrix A n*n
A = reshape(T(2:n*n+1),n,n);
A = A';     % matrix A
b = T(n*n+2:end);   % vector b
% disp(A)
% disp(b);
detA = gauss(A);
fprintf('determinant A = %.3f\n',detA);

detAn = zeros(n,1);
x = zeros(n,1);
if detA~=0
    for i = 1:n
        An = A;
        An(:,i) = b;
        detAn(i) = gauss(An);
        x(i) = detAn(i)/detA;
        fprintf('determinant A%d = %.3f\n',i,detAn(i));
    end
else
    dis('det(A) = 0');
end
for i = 1:n
    fprintf('x%d = %.5f\n',i,x(i));
end

end
function [detA,C] = gauss(A)
%GAUSS ½øÐÐ¸ßË¹ÏûÔª·¨
%   A
[m,n] = size(A);
if m~=n
    disp('is not square matrix');
end
C = A;
for j = 1:(n-1)
    for i= (j+1):n
        if C(j,j)~=0
            mult = C(i,j)/C(j,j) ;
            for k= j:n
                C(i,k) = C(i,k) - mult*C(j,k) ;
            end
        end
    end
end
detA = C(1);
for i = 2:n
    detA = detA*C(i,i);
end
end

T = [3 3 4 2 -1 3 -4 2 2 5 5 2 -6]';
[x,detA,detAn,A,b] = cramer(T);

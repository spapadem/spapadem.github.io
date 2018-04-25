
A = [1 -3; -3 1];
[M, N] = size(A);
z = zeros(M,1);
z(2) = 1;

TOL = 1e-6;

x = z;

while(1)
    y = A*x;
    xnew = y/norm(y,'inf');
    
    if norm(x-xnew,'inf') < TOL
        break;
    end
    
    x = xnew;
end


norm(y,'inf')
xnew

%[V,D] = eig(A)
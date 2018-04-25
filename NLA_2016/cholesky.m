% Size of the system
d = 10;
% Create the symmetric matrix.
AL = tril(rand(d));
A = AL*AL.';
% Right-hand side.
b = rand(d,1);

% Exact solution, computed the operator '\'
x_ex = A\b;

% Cholesky decomposition.
L = zeros(size(A));
for i = 1 : d
    for j = 1 : i - 1
        Lsum = 0;
        for k = 1 : j - 1
            Lsum = Lsum + L(i,k)*L(j,k);
        end
        L(i,j) = (A(i,j) - Lsum)/L(j,j);
    end
    Lsumsq = 0;
    for k = 1 : i - 1
            Lsumsq = Lsumsq + L(i,k)*L(i,k);
    end
    L(i,i) = sqrt(A(i,i) - Lsumsq);
        
end

% Verify our approximation of L is good
Lerr = norm(L-AL,'inf')/norm(L,'inf')


% Solve Ly = b.
y = zeros(d,1);
for i = 1 : d
    tsum = 0;
    for j = 1 : i-1
        tsum = tsum + L(i,j)*y(j);
    end
    y(i) = (b(i) - tsum)/L(i,i);
end

% Solve L^Tx = y.
x = zeros(d,1);
for i = d : -1 : 1
    tsum = 0;
    for j = i+1 : d
        tsum = tsum + L(j,i)*x(j);
    end
    x(i) = (y(i) - tsum)/L(i,i);
end

% Compute the error in the solution.
xerr = norm(x-x_ex,'inf')/norm(x_ex,'inf')


plot(1:d,x_ex,'o-',1:d,x,'r*-')
shg



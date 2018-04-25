% Size of the system
d = 10;
% Epsilon, set for an example.
epsilon = 0.1;
% Create the tri-diagonal matrix.
A = 2*eye(d) - diag(ones(d-1,1),-1) - diag(ones(d-1,1),1) ;
% Right-hand side.
b = zeros(d,1);
b(1) = 1;
b(end) = 1;

% Exact solution, computed the operator '\'
x_ex = A\b;

B = zeros(d,2);
G = zeros(d,2);

B(1,1) = 0;
for i = 1 : d
    B(i,2) = A(i,i);
end
for i = 2 : d
    B(i,1) = A(i,i-1);
end

G(1,1) = 0;
for k = 1 : d
    G(k,2) = sqrt(B(k,2)-G(k,1)*G(k,1));
    if(k==d) 
        continue 
    end
    G(k+1,1) = B(k+1,1)/G(k,2);
end

Lchol = chol(A,'lower');

diag(Lchol)-G(:,2)
diag(Lchol,-1)-G(2:end,1)

y = zeros(d,1);
y(1) = b(1)/G(1,2);
for i = 2 : d
    y(i) = (b(i)-G(i,1)*y(i-1))/G(i,2);
end

x = zeros(d,1);
x(d) = y(d)/G(d,2);
for i = d-1 : -1 : 1
    x(i) = (y(i) - G(i+1,1)*x(i+1))/G(i,2);
end

% Compute the error in the solution.
xerr = norm(x-x_ex,'inf')/norm(x_ex,'inf')


plot(1:d,x_ex,'o-',1:d,x,'r*-')
shg



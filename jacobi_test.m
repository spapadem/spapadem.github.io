N = 100;
epsilon = 0.4;
A = eye(N) + diag(epsilon*ones(N-1,1),-1) + diag(-epsilon*ones(N-1,1),1) ;
b = rand(N,1);

x_ex = A\b;

x_jac = ones(N,1);
D = diag(diag(A));
R = A-D;

Dinv = diag(1./diag(D));
Nmax = 100;
for i = 1 : Nmax
	temp = Dinv*(b+R*x_jac);
	x_jac = temp;
end

plot(1:length(x_ex),x_ex,'o-',1:length(x_jac),x_jac,'r*-')
shg

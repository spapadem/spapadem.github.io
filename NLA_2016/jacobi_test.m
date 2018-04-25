% Size of the system
d = 10;
% Epsilon, set for an example.
epsilon = 0.1;
% Create the tri-diagonal matrix.
A = eye(d) + diag(epsilon*ones(d-1,1),-1) + diag(-epsilon*ones(d-1,1),1) ;
% Right-hand side.
b = ones(d,1);
b(1) = 1 + epsilon;
b(end) = 1 - epsilon;

% Exact solution, computed the operator '\'
x_ex = A\b;

% Initial guess for our approximation
x_jac = zeros(d,1);

% Create the matrices D = a_ii and R = A - D (= L + U).
D = diag(diag(A));
R = A-D;

% The inverse of D, computed manually, since it's diagonal.
Dinv = diag(1./diag(D));

% The tolerance we want.
TOL = 1e-5;
% The maximum number of iterations, if the method does not converge.
Nmax = 50;
% Counter for the number of iterations needed for the method to converge.
Niter = 0;
% Jacobi method.
while(1)
	% Computation of the next approximation.
	temp = -Dinv*(R*x_jac-b);	
	Niter = Niter + 1;

	% Computing the sigma function.
	if(norm(x_jac,'inf') == 0)
		s = 1;
	else
		s = norm(x_jac,'inf');
	end

	% Convergence check.
	if(norm(temp-x_jac,'inf')/s <= TOL|| Niter == Nmax)
		break;
	end
	
	% Replace our new approximation as the current approximation.
	x_jac = temp;
end

% Print output.
fprintf('    Exact     Approx.\n')
disp([x_ex,x_jac])
fprintf('Iterations needed for TOL = %g, was: %d \n',TOL,Niter)

% Plot and compare the results.
plot(1:length(x_ex),x_ex,'o-',1:length(x_jac),x_jac,'r*-')
legend('Exact','Approximate','Location','Best')
shg




n = 100;
x = 1/n*ones(n,1);
A = hilb(n);

while(1)
   y = A*x;
   w = sign(y);
   z = A'*w;
   if(norm(z,'inf') <= z'*x)
       gB = norm(y,1)
       break;
   else
       k = find(z==norm(z,'inf'));
       x = zeros(n,1);
       x(k(1)) = 1;
   end
   
end

norm1 = norm(A,1)
rel_err = (gB-norm1)/gB
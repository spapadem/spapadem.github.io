function [A,b] = HH(A,b)
M = size(A,1);
kc = 1;

while (1)
    km = M - kc + 1;
    v = A(kc:M,kc);
%     if kc <M
     if v(2:km) == zeros(km-2+1,1)
         kc = kc +1;
         continue;
     end
%     end
    u = v;
    u(1) = v(1) + sgn(v(1))*norm(v,2);
    
    theta = .5*norm(u,2)^2;
    A(kc,kc) = -sgn(v(1))*norm(v,2);
    
    for i = 1 : km
        A(kc+i,kc) = u(i);
    end


    
    for j = kc+1 : M
        v = A(kc:end-1,j);
        for i = 1 : km
            A(kc-1+i,j) = v(i) - 1/theta*v'*u*u(i);
        end
    end
    
    v = b(kc:M);

    b(kc:M) = v - 1/theta*v'*u*u;

    A(kc+1:M,kc) = zeros(M-kc,1);
    kc = kc + 1;
    if kc == M
        break;
    end
end



end

function s = sgn(x)

l = length(x);
s = ones(l,1);

for i = 1 : l
    if x(i) < 0
        s(i) = -1;
    end
end

end

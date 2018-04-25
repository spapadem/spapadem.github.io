clear all
close all
M = 10;
A = 4*eye(M) - diag(ones(M-1,1),1) - diag(ones(M-1,1),-1);
b = 2*ones(M,1);
v = zeros(M,1);
b(1) = 3; b(M) = 3;
ipvt = 1 : M;
kc = 1;
while(kc<=M)
    kmax = 0;
    k = kc;
    for i = kc : M
        if abs(A(i,kc)) > kmax
            kmax = abs(A(i,kc));
            k = i;
        end
        ipvt(kc) = k;
    end
    
    tmp = A(kc,kc:M);
    A(kc,kc:M) = A(k,kc:M);
    A(k,kc:M) = tmp;
    
    for i = kc+1 : M
        v(i) = - A(i,kc)/A(kc,kc);
        A(i,kc) = v(i);
    end
    for i = kc+1 : M
        for j = kc+1 : M
            A(i,j) = A(i,j) + v(i)*A(kc,j);
        end
     end
    kc = kc + 1;
    
end

for i = 1 : M-1
    if ipvt(i) ~= i
        tmp = b(i);
        b(i) = b(ipvt(i));
        b(ipvt(i)) = tmp;
    end
    for j = i + 1 : M
        b(j) = b(j) + A(j,i)*b(i);
    end
end


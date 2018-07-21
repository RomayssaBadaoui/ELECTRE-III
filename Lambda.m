function [lambda1]=Lambda(A,B,n,a,b)
%B=A;
MatSur=zeros(n);
lambda0=max(max(A));
s=a+(b*lambda0);
lambda=lambda0-s;
for i=1:n
    for j=1:n
        if i~=j
            if B(i,j)>=lambda
                B(i,j)=-inf;
            end
        end
    end
end
B;
lambda1=max(max(B));
if lambda1==-inf
lambda1=0;
end
for i=1:n
    for j=1:n
        if i~=j
           if A(i,j)>=lambda1
               if A(i,j)>(A(j,i)+(a+(b*A(i,j))))
                   MatSur(i,j)=1;
               end
           end
        end
    end
end
lambda1=lambda1;
end
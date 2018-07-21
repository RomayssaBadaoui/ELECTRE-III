function [Mat]=Mat_Surclassement_Etapes(lambda0,A,B,act_r,n,a,b)
%B=A;
%lambda0=max(max(A));
%%%%%%
% C=[]; D=[];
% C=B(:,act_r);
% D=B(act_r,:);
% max1=max(max(C));
% max2=max(max(D));
% maximum=max1;
% if max1<max2
%     maximum=max2;
% end
% lambda0=maximum;
%%%%%%%
MatSur=zeros(n);
s=a+(b*lambda0);
lambda=lambda0-s;
[c,v]=size(act_r);
for i=1:v
    for j=1:n
        if act_r(i)==j
            for k=1:n
                if j~=k
                    if B(k,j)>=lambda
                        B(k,j)=-inf;
                    end
                end
            end
        end
    end
end

B;
C=[]; D=[];
C=B(:,act_r);
D=B(act_r,:);
max1=max(max(C));
max2=max(max(D));
maximum=max1;
if max1<max2
    maximum=max2;
end

% for i=1:n
%     for j=1:n
%         if i~=j
%             if B(i,j)>=lambda
%                 B(i,j)=-inf;
%             end
%         end
%     end
% end
% B;
% lambda1=max(max(B));
lambda1=maximum;
if lambda1==-inf

lambda1=0;
end
A;
for i=1:n
    for j=1:n
        if i~=j
           if A(i,j)>lambda1
               if A(i,j)>(A(j,i)+(a+(b*A(i,j))))
                   MatSur(i,j)=1;
               end
           end
        end
    end
end
Mat=MatSur;
end
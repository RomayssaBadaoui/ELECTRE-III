%%% A c'est la matrice de classement du préordre complet
%%% Pour le résultat : 
%%% 2 action préférée
%%% 1 actions équivalentes
%%% 0 pas préférée

function [mat]=MatricePreference(A,n)
A;
[a,b]=size(A);
mat=zeros(n,n);
y=ones(1,n);
y;
for i=1:n-1
    cpt=1; vect=[]; vect(1)=A(i,2);
    for j=i+1:n
        if A(i,1)==A(j,1)
            cpt=cpt+1;
            vect(cpt)=A(j,2);
        end
    end
    vect;
    [c,v]=size(vect);
    v;
    if v==1
        for k=1:n
            if y(k)==1
                mat(A(i,2),k)=2;
            end
        end
        y(vect)=0;
        mat;
    else
        for k=1:v
            for j=1:v
                if k~=j
                    mat(vect(k),vect(j))=1; %%%% 2---1
                  %  mat(A(vect(j),2),A(vect(k),2))=1; %%%% 2---1
                end
            end
            
            mat;
            y(vect(k))=0;
            y;
            
        end
        for k=1:v
            for l=1:n
                if y(l)==1
                    
                    mat(vect(k),l)=2; 
                   
                end
            end
        end
            mat;
        
    end
    
  y;
    
    
    
    
end
mat;
for i=1:n
    mat(i,i)=-inf;
end
mat;
end
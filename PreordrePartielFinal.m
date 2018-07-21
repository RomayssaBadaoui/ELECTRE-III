%%%%% A: matrice de préférence du preordre complet direct
%%%%% B: matrice de préférence du préordre complet inverse
%%%%% 2 : préférable
%%%%% 1 : équivalente
%%%%% 0 : non préférable
%%%%% -1 : incomparable

function [mat]=PreordrePartielFinal(A,B,n)
mat=zeros(n,n);
for i=1:n
    for j=1:n
        if i~=j
            if A(i,j)==2
                if B(i,j)==2
                    mat(i,j)=2;
                else if B(i,j)==1
                        mat(i,j)=2;
                    else 
                        mat(i,j)=-1;
                    end
                end
            else if A(i,j)==1
                    if B(i,j)==2
                        mat(i,j)=2;
                    else if B(i,j)==1
                           mat(i,j)=1;
                        else
                            mat(i,j)=0;
                    end
                    end
                else
                    if B(i,j)==2
                        mat(i,j)=-1;
                    else if B(i,j)==1
                            mat(i,j)=0;
                        else
                            mat(i,j)=0;
                        end
                    end
                end
            end
        else
            mat(i,j)=-inf;
        end
    end
end



 
 
 
 
 
 
 
 end 
 


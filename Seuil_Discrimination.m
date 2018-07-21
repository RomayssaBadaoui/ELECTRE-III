%%%%% A : Matrice des degrés de crédibilité
%%%%% a et b : les coefficients de la fonction du seuil de discrimination
%%%%% n : nombre d'actions

function [mat]=Seuil_Discrimination(A,a,b,n)
mat=zeros(1,1);
for i=1:n
    for j=1:n
        if i~=j
        lambda=A(j,i);
        seuil=a+(b*lambda);
        mu=lambda-A(i,j);
        if mu>seuil
            mat(j,i)=1;
        end
        else
            mat(i,j)=-inf;
        end
    end
end
mat;
end
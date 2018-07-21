%%%%% Fonction pour calculer l'indice de concordance pour chaque crit�re
%%%%% B : Matrice d'�valuation du probl�me (colonne sp�c�fique au crit�re
%%%%% �tudi�)
%%%%% P : le seuil de pr�f�rence correpondant au crit�re
%%%%% Q : le seuil d'indiff�rence correspondant au crit�re
%%%%% n : le nombre d'actions

function [mat]=Indice_Concordance_Par_Critere(B,P,Q,n)

mat=zeros(n,n);
for i=1:n
    for j=1:n
        if i~=j
            result=B(j,1)-B(i,1);
            if result>P
                mat(i,j)=0;
            end
            if result>Q && result<=P
                mat(i,j)=(B(i,1)+P-B(j,1))/(P-Q);
            end
            if result<=Q
                mat(i,j)=1;
            end
         else
            mat(i,j)=-inf;
        end
    end
end
mat;
end
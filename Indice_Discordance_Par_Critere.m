%%%%% Fonction pour calculer l'indice de discordance pour chaque crit�re
%%%%% B : Matrice d'�valuation du probl�me (colonne sp�c�fique au crit�re
%%%%% �tudi�)
%%%%% P : le seuil de pr�f�rence correpondant au crit�re
%%%%% V : le seuil de veto correspondant au crit�re
%%%%% n : le nombre d'actions

function [mat]=Indice_Discordance_Par_Critere(B,P,V,n)

mat=zeros(n,n);
for i=1:n
    for j=1:n
        if i~=j
            result=B(j,1)-B(i,1);
            if result>V
                mat(i,j)=1;
            end
            if result>P && result<=V
                mat(i,j)=(B(j,1)-P-B(i,1))/(V-P);
            end
            if result<=P
                mat(i,j)=0;
            end
         else
            mat(i,j)=-inf;
        end
    end
end
mat;

end
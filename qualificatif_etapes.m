function [qual]=qualificatif_etapes(MatSur,act_r,n)
puissance=zeros(1,n);
faiblesse=zeros(1,n);
qual=zeros(1,n);
[c,v]=size(act_r);
for i=1:v
  resultat2=0;
    for j=1:n
        resultat2=resultat2+MatSur(j,act_r(i));
    end
    faiblesse(act_r(i))=resultat2;
end
for i=1:v
    resultat2=0;
    for j=1:n
        resultat2=resultat2+MatSur(act_r(i),j);
    end
    puissance(act_r(i))=resultat2;
end

for i=1:n
    qual(i)=puissance(i)-faiblesse(i);
end
puissance;
faiblesse;
qual;
end
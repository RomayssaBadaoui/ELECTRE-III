function [qual]=qualificatif(MatSur,n)
puissance=zeros(1,n);
faiblesse=zeros(1,n);
qual=zeros(1,n);
for i=1:n
    resultat1=0;
    resultat2=0;
    for j=1:n
        resultat1=resultat1+MatSur(i,j);
        resultat2=resultat2+MatSur(j,i);
    end
    puissance(i)=resultat1;
    faiblesse(i)=resultat2;
end
for i=1:n
    qual(i)=puissance(i)-faiblesse(i);
end
puissance;
faiblesse;
qual;
end
function [Incomparabilite]=ELECTRE_III_incomparabilite(n,m,A,poids,p,q,v,a,b)

%%%%%% Trouver l'indice de concordance par critère
for j=1:m
    MatriceConcorCritere=Indice_Concordance_Par_Critere(A(:,j),p(j),q(j),n)
end

%%%%%%% Trouver l'indice de discordance par critère
for j=1:m
    MatriceDiscordCritere=Indice_Discordance_Par_Critere(A(:,j),p(j),v(j),n);
end

%%%%%% Calculer l'indice de concordance globale
ConcordGlobale=zeros(n,n);
for i=1:n
    for k=1:n
        if i~=k
            tab=zeros(1,m);
            for j=1:m
            MatriceConcorCritere=Indice_Concordance_Par_Critere(A(:,j),p(j),q(j),n);
            tab(j)=MatriceConcorCritere(i,k);
            end
            tab;
            resultat=0;
            for j=1:m
                resultat=resultat+(tab(j)*poids(j));
            end
            resultat;
            ConcordGlobale(i,k)=resultat/100;
        else
            ConcordGlobale(i,k)=-inf;
        end
    end
end

ConcordGlobale

%%%%% Trouver la matrice de degrés de crédibilité 
DegresCredibilite=zeros(n,n);
for i=1:n
    for k=1:n
        if i~=k
            tab=zeros(1,m);
            for j=1:m
            MatriceDiscordCritere=Indice_Discordance_Par_Critere(A(:,j),p(j),v(j),n);
            tab(j)=MatriceDiscordCritere(i,k);
            end
            tab;
            resultat=1;
            for j=1:m
                if tab(j)>ConcordGlobale(i,k)
                resultat=resultat*((1-tab(j))/(1-ConcordGlobale(i,k)));
                end
            end
            resultat;
            DegresCredibilite(i,k)=ConcordGlobale(i,k)*resultat;
        else
            DegresCredibilite(i,k)=-inf;
        end
    end
end

DegresCredibilite



               %%%%%%% Algorithme de classement %%%%%%

Classement=Destillation_Descendante(DegresCredibilite,n,a,b)
Classement2=Destillation_Ascendante(DegresCredibilite,n,a,b);


%Mettre en ordre le classement inverse
 [a,b]=size(Classement2);
 tab=zeros(a,b); k=a; r_max=Classement2(a,1);
 for i=1:a
     
         tab(i,1)=1+r_max-Classement2(k,1);
         tab(i,2)=Classement2(k,2);
     
     k=k-1;
 end
 Classement2=tab

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Construction de préordre partiel final
 MatPref=MatricePreference(Classement,n);
 MatPref2=MatricePreference(Classement2,n);
 MatPreordreFinal=PreordrePartielFinal(MatPref,MatPref2,n);
 for i=1:n
     MatPreordreFinal(i,i)=0;
 end
 mat=MatPreordreFinal;
 %Solution=Classement(MatPreordreFinal,n)
 %%%%%%%%%%%%% %%%%%%%%%%%%%%%%
 %%%%%%%%%%
 %
 Class=[];
resultat=zeros(n,1);
for i=1:n
     for j=1:n
         if i~=j
             if mat(i,j)==2
           resultat(i,1)=resultat(i,1)+1;  
             end
         end
     end
 end
 resultat;
 D=sort(resultat,'descend');
 resultat1=resultat;
 tab=zeros(n,1);
 cpt=0;
 for i=1:n
     for j=1:n
         if D(i,1)==resultat1(j,1)
             cpt=j;
             
         end
     end
     tab(i,1)=cpt;
     resultat1(cpt,1)=-inf;
     resultat1;
 end
 tab;

 ordre=zeros(n,1);
 cpt=1; ordre(1,1)=cpt;
for i=1:n-1
    j=i+1;
    if D(i)~= D(j)
        cpt=cpt+1;
    end
    ordre(j,1)=cpt;
end
ordre;
Class=[Class,ordre,tab]
Incomparabilite=[];
Equivalence=[];
for i=1:n
    for j=i+1:n
        if i~=j
            if mat(i,j)==-1
                Incomparabilite=[Incomparabilite;i,j];
            end
            if mat(i,j)==1
                Equivalence=[Equivalence;i,j];
            end
        end
    end
end
Incomparabilite
Equivalence
end
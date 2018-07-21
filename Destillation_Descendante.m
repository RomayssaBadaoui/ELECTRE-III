function [Classement]=Destillation_Descendante(DegresCredibilite,n,a,b)
A=DegresCredibilite;
B=A;
Y=ones(1,n);
cpt1=0;
Classement=[];
%for i=1:2
cpt=n; 
while cpt~=0
   
MatSur=Matrice_Surclassement(A,B,n,a,b);
lambda1=Lambda(A,B,n,a,b);
%B=Avoir_B(A,B,n,a,b);
qual=qualificatif(MatSur,n);
act_r=Act_R(qual,Y,n);

[c,v]=size(act_r);
if v==1
A(act_r,:)=0;
A(:,act_r)=0;
B(act_r,:)=0;
B(:,act_r)=0;
Y(act_r)=0;
cpt1=cpt1+1;
Classement=[Classement;cpt1,act_r(1)];
else
nn=0;
%%%% 
lambda0=lambda1;
%%%%
while nn==0
   
  % lambda0=lambda1; 
 
   MatSur=Mat_Surclassement_Etapes(lambda0,A,B,act_r,n,a,b);
   lambda1=Lambda_Etapes(lambda0,A,B,act_r,n,a,b);
  % B=Avoir_B_Etapes(lambda0,A,B,act_r,n,a,b)
   qual=qualificatif_etapes(MatSur,act_r,n);
   act_r=Act_R_Etapes(qual,Y,act_r,n);
   lambda0=lambda1; %%%%%%
   
[c,v]=size(act_r);
if v==1
   nn=1;
else 
      %nn=1 %%%%%%
    if lambda1==0
        nn=1;
    end
end
   
end

A(act_r,:)=0;
A(:,act_r)=0;
B(act_r,:)=0;
B(:,act_r)=0;
Y(act_r)=0;
[c,v]=size(act_r);
cpt1=cpt1+1;
for i=1:v
Classement=[Classement;cpt1,act_r(i)];
end



A;
end

Y;
cpt=0;
for i=1:n
if Y(i)==1
cpt=cpt+1;
end
end
end
cpt ;
Y;
Classement;
end
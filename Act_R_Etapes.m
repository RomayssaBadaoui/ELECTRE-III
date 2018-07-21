function [act_r]=Act_R_Etapes(qual,Y,act_r,n)
qual1=qual(act_r);
maximum=max(qual1);
cpt=0;
act_r1=[];
[c,v]=size(act_r);
for i=1:v
    if qual1(i)==maximum
        
       
            cpt=cpt+1;
            act_r1(cpt)=act_r(i);
       
        
    end
end
act_r=act_r1;
end
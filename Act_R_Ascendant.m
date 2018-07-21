function [act_r]=Act_R_Ascendant(qual,Y,n)
minimum=min(qual);
cpt=0;
act_r=[];
for i=1:n
    if Y(i)==1
        if qual(i)==minimum
            cpt=cpt+1;
            act_r(cpt)=i;
        end
        
    end
end
act_r;
end
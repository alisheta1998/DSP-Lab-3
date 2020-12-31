function decode_cell= decode_cell(r,DCTQ,DCT_Blocks)

decode_cell = DCT_Blocks;
T=r*DCTQ;
[i,j] = size(DCT_Blocks);
for Icounter = 1:1:i
        
    for Jcounter= 1:1:j

        decode_cell{Icounter,Jcounter} = DCT_Blocks{Icounter,Jcounter}.*T   ;
    end

end


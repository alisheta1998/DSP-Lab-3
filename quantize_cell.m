function Quantized_Cell = quantize_cell (r,DCTQ,DCT_Blocks)
Quantized_Cell = DCT_Blocks;
T=r*DCTQ;
[i,j] = size(DCT_Blocks);
for Icounter = 1:1:i
        
    for Jcounter= 1:1:j

        Quantized_Cell{Icounter,Jcounter} =round(  DCT_Blocks{Icounter,Jcounter}./T)   ;
    end
end

function DCT = blockDCT(gmarble_divided,C8,C8t)
DCT=cell(126,178);
for i = 1:178
   for j = 1:126
      DCT(i,j) = C8*gmarble_divided(i,j)*C8t;
   end
end
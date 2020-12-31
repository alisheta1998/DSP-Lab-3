function DCT_Blocks = blockDCT(gmarbles_divided,C8,C8t)

%Where gmarble_divided is the image divided to 8*8 matrices

DCT_Blocks = cellfun(@(x) round(C8 * double(x) *C8t),gmarbles_divided,'UniformOutput',false);
%%
clear;clc;
%PART 1.2 (DONE)
%Pre-calculating C8 using Equation (2)
N=8;
for r = 0:N-1
    for k = 0:N-1
        if k==0
           uk=sqrt(1/N); 
        else
           uk=sqrt(2/N);
        end
        C8(k+1,r+1)=uk*cos(3.14*k*(r+0.5)/N);
    end
end
C8t=transpose(C8);
C8inv=inv(C8);
%Comment : Transpose is equal to the Index
%%
%PART 2.1.1 (DONE)
%Split the image to 8*8 matrices
gmarbles = imread('gmarbles.tif');
%
figure; 
colormap(gray(256));
image(gmarbles);
axis image;
%
s=size(gmarbles);
gmarbles = padarray(gmarbles,[7 5],0,'post');
s3=size(gmarbles);
gmarbles_divided = mat2cell(gmarbles,8*ones(1,size(gmarbles,1)/8),8*ones(1,size(gmarbles,2)/8));
%%
%PART 2.2 (DONE)
%Here we make DCT for each matrix in the cell
DCT_Blocks = blockDCT(gmarbles_divided,C8,C8t);
%%
%PART 2.3.1
%
DCTQ=[16 11 10 16 24 40 51 61;
      12 12 14 19 26 58 60 55;
      14 13 16 24 40 57 69 56;
      14 17 22 29 51 87 80 62;
      18 22 37 56 68 109 103 77;
      24 35 55 64 81 194 113 92;
      49 64 78 87 103 121 120 101;
      72 92 95 98 121 100 103 99];
%Scaling factor => r
r = 1 ;
quantizedImage = quantize_cell (r,DCTQ,DCT_Blocks);

%%
%PART 3.1.1(DONE)
decodedImage = decode_cell(r,DCTQ,quantizedImage);

%%
%PART 3.2.1 (DONE)
%Inverse function using the same DCT function just switching the C8 and C8t
Inverse_DCT_Blocks = blockDCT(decodedImage,C8t,C8);
%%
%PART 3.3 (Done)

compressedImage = uint8(cell2mat(Inverse_DCT_Blocks));
figure
colormap(gray(256));
image(compressedImage)

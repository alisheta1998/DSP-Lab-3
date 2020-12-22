%%
%PART 1.2 (DONE)
%Pre-calculating C8 using Equation (2)
N=8;
for r = 0:N-1
    for k = 0:N-1
        if k==0
           uk=sqrt(1/N) 
        else
           uk=sqrt(2/N)
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
% g1=padarray(gmarbles,7,0,'post');
% s1=size(g1);
% g2=padarray(g1,[0 5],0,'post');
% s2=size(g2);
gmarbles = padarray(gmarbles,[7 5],0,'post');
s3=size(gmarbles);
gmarbles_divided = mat2cell(gmarbles,8*ones(1,size(gmarbles,1)/8),8*ones(1,size(gmarbles,2)/8));
%%
%PART 2.2
%Here we make DCT for each matrix in the cell
DCT = blockDCT(gmarbles_divided,C8,C8t);
%%
%PART 2.3.1

%%
%PART 3.1.1

%%
%PART 3.2.1

%%
%PART 3.3
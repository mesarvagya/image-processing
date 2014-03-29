function noi=mymedian(A)
%READ AN 2D IMAGE
%A=rgb2gray(A);
%imshow(A);
%A=imread('C:/sarv.jpg');
A=im2double(A);
[m,n,p]=size(A);
if m>400 || n>400
    A=imresize(A,0.4,'bilinear');
end

r=A(:,:,1);
g=A(:,:,2);
b=A(:,:,3);
r=padarray(r,[1 1]);
g=padarray(g,[1 1]);
b=padarray(b,[1 1]);

         
for i= 2:size(r,1)-2
    for j=2:size(r,2)-2
       
        r(i,j)=median(median(r(i-1:i+1,j-1:j+1)));
        g(i,j)=median(median(g(i-1:i+1,j-1:j+1)));
        b(i,j)=median(median(b(i-1:i+1,j-1:j+1)));
        
    end
end

%CONVERT THE OUTPUT MATRIX TO 0-255 RANGE IMAGE TYPE
B=zeros([size(r),3]);
B(:,:,1)=r;
B(:,:,2)=g;
B(:,:,3)=b;
noi=B;


end

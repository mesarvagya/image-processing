function [img ]= myfilter(f, w)
%MYFILTER Performs spatial correlation
%   I=MYFILTER(f, w) produces an image that has undergone correlation.
%   f is the original image
%   w is the filter (assumed to be 3x3)
%   The original image is padded with 0's 

% check that w is 3x3
[m,n]=size(w);
if m~=3 | n~=3
    error('Filter must be 3x3')
end

%get size of f
[x,y,z]=size(f);

%create padded f (called g)
%first, fill with zeros
g=zeros(x+2,y+2);
%then, store f within g
for i=1:x
    for j=1:y
        g(i+1,j+1)=f(i,j);
    end
end

%cycle through the array and apply the filter 
for i=1:x
    for j=1:y
        img(i,j)=g(i,j)*w(1,1)+g(i+1,j)*w(2,1)+g(i+2,j)*w(3,1)...
        + g(i,j+1)*w(1,2)+g(i+1,j+1)*w(2,2)+g(i+2,j+1)*w(3,2)...
        + g(i,j+2)*w(1,3)+g(i+1,j+2)*w(2,3)+g(i+2,j+2)*w(3,3);
    end
end

%Convert to uint--otherwise there are double values and the expected
%range is [0, 1] when the image is displayed

img=uint8(img); 
%disp(img);

%imshow(img);
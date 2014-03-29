function img = histog( im )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[a,b]=size(im);
him=uint8(zeros(a,b));
pixelno=a*b;
freq=zeros(256,1);
probf=zeros(256,1);
probc=zeros(256,1);
cum=zeros(256,1);
output=zeros(256,1);

 for i=1:a
    for j=1:b
        value=im(i,j);
        freq(value+1)=freq(value+1)+1;
        probf(value+1)=freq(value+1)/pixelno;
    end
end
 sum=0;
no_bins=255;
 for i=1:size(probf)

   sum=sum+freq(i);

   cum(i)=sum;

   probc(i)=cum(i)/pixelno;

   output(i)=round(probc(i)*no_bins);

 end
 for i=1:a
    for j=1:b   
      him(i,j)=output(im(i,j)+1);
    end
end
img=him;

end


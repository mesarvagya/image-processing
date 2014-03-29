function [ ret,F] = fftfilter( im, select )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
PQ=paddedsize(size(im));
[U,V]=dftuv(PQ(1),PQ(2));
 F=fft2(im,PQ(1),PQ(2));
 switch select
     case 1
         D0=0.05*PQ(2);
         H=exp(-(U.^2+V.^2)/(2*(D0^2)));
     case 2
         D0=0.05*PQ(2);
         H=1-exp(-(U.^2+V.^2)/(2*(D0^2)));
     case 3
         D0=0.25*PQ(2);
         n=10;
         H=1./(1+sqrt(U.^2+V.^2)/D0).^(2*n);
     case 4
         D0=0.25*PQ(2);
         n=10;
         H=1-1./(1+sqrt(U.^2+V.^2)/D0).^(2*n);
         
 end
ret= dftfilt(im,H);


end


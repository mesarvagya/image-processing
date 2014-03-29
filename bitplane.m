function bitplane(im)
img=rgb2gray(im);
[m,n] = size(img);
c = cell(1,8);
for i = 1:m
    for j = 1:n
            b = im(i,j);
              if ( b >= 128)
                b = b-128; c{1,1}(i,j) = 1;
              else
                  
                c{1,1}(i,j) = 0;
              end
             if (b >= 64)
                b = b - 64; c{1,2}(i,j) = 1;
             else
                c{1,2}(i,j) = 0;
             end
            if (b >= 32)
                b = b -32; c{1,3}(i,j) = 1;
            else
                c{1,3}(i,j) = 0;
            end
            if (b >= 16)
                b = b -16; c{1,4}(i,j) = 1;
            else
                c{1,4}(i,j) = 0;
            end
            if (b >= 8)
                b = b - 8; c{1,5}(i,j) = 1;
            else
                c{1,5}(i,j) = 0;
            end
            
            if (b >= 4)
                b = b -4; c{1,6}(i,j) = 1;
            else
                c{1,6}(i,j) = 0;
            end
            if (b >= 2)
                b = b -2; c{1,7}(i,j) = 1;
            else
                c{1,3}(i,j) = 0;
            end
            if (b >= 1)
                b = b -1; c{1,8}(i,j) = 1;
            else
                c{1,8}(i,j) = 0;
            end
    end
end
f1 = c{1,1}; f2 = c{1,2}; f3 = c{1,3}; f4 = c{1,4};
f5 = c{1,5}; f6 = c{1,6}; f7 = c{1,7}; f8 = c{1,8};
figure,subplot(2,2,1),imshow(f1),title('Bitplane 8'),subplot(2,2,2),imshow(f2),title('Bitplane 7'),
subplot(2,2,3),imshow(f3),title('Bitplane 6'),subplot(2,2,4),imshow(f4),title('Bitplane 5');
figure,subplot(2,2,1),imshow(f5),title('Bitplane 4'),subplot(2,2,2),imshow(f6),title('Bitplane 3'),
subplot(2,2,3),imshow(f7),title('Bitplane 2'),subplot(2,2,4),imshow(f8),title('Bitplane 1');


end
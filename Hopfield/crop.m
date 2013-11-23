%% crops the original image

function [crop_img]=crop(original, picX, picY)

%% caluclate size of the input image and make it a square image
[x, y, z]=size(original);
if x<y
    original=imresize(original,[x x]);
else
    original=imresize(original,[y y]);
end


%% convert it into black and white

bw1=double(im2bw(original,0.3));

%% add noise on it and then remove it.
J = imnoise(bw1,'salt & pepper',0.0001);
J = -1 * (J - 1);
L = medfilt2(J,[5 5]);

% calculate the size of filtered image
[x, y, z]=size(L);

% figure('name','black and white');
% imshow(L);

%% create variables to store the coordinates of the 1st white pixel from each
% direction

top=0;
toppos_b=0;
left=0;
leftpos_a=0;
right=0;
rightpos_a=0;
bottom=0;
bottompos_b=0;

%% calculate 1st white pixel from each direction
for i=1:x-1
    for j=1:y-1
        if top==0 && L(i,j)==1 
            toppos_b=i;
            top=1;
        end
        if left==0 && L(j,i)==1 
            leftpos_a=i;
            left=1;
        end
        if right==0 && L(j,x-i)==1 
            rightpos_a=x-i;
            right=1;
        end
        if bottom==0 && L(x-i,j)==1 
            bottompos_b=x-i;
            bottom=1;
        end
        if top==1 && left ==1 && right==1 && bottom==1
            break
        end
    end
end

%% crop original image to remove extra background
crop_img=imcrop(original,[leftpos_a toppos_b rightpos_a-leftpos_a bottompos_b-toppos_b]);

crop_img=imresize(crop_img,[picX picY]);
%% Code for gesture recognition for human sign language - a course project
%% for Artificial Neural Networks.
clear all;

% Contants
normX = 50;
normY = 50;

y1=crop(imread('gest1.jpg'), normX, normY);
y11 = im2bw_skin(y1, normX, normY);
y1 = y11;

y2=crop(imread('gest2.jpg'), normX, normY);
y22 = im2bw_skin(y2, normX, normY);
y2 = y22;

y3=crop(imread('gest3.jpg'), normX, normY);
y33 = im2bw_skin(y3, normX, normY);
y3 = y33;

y4=crop(imread('gest4.jpg'), normX, normY);
y44 = im2bw_skin(y4, normX, normY);
y4 = y44;

y5=crop(imread('gest5.jpg'), normX, normY);
y55 = im2bw_skin(y5, normX, normY);
y5 = y55;

%%

temp1 = [];
temp2 = [];
temp3 = [];
temp4 = [];
temp5 = [];
for i=1:normX
    for j = 1:normY
        temp1 = [temp1 y1(i,j)];
        temp2 = [temp2 y2(i,j)];
        temp3 = [temp3 y3(i,j)];
        temp4 = [temp4 y4(i,j)];
        temp5 = [temp5 y5(i,j)];
    end
end
y1 = temp1';
y2 = temp2';
y3 = temp3';
y4 = temp4';
y5 = temp5';

y1 = 2*y1 - 1;
y2 = 2*y2 - 1;
y3 = 2*y3 - 1;
y4 = 2*y4 - 1;
y5 = 2*y5 - 1;

w = y1*y1'+y2*y2'+y3*y3'+y4*y4'+y5*y5' - 5 * eye(normX * normY);

save w;

disp('Training done');
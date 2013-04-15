%% Code for gesture recognition for human sign language - a course project
%% for Artificial Neural Networks.
clear all;

% Contants
normX = 100;
normY = 100;

% display original
figure
imshow(imread('1.jpg'));
y1=crop(imread('1.jpg'), normX, normY);%[1 1 0 0 0; 1 1 0 0 0];

figure
imshow(y1);
y2 = im2bw_skin(y1, normX, normY);
figure
imshow(y2);

disp('done :)');
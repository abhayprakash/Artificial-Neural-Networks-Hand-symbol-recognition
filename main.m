%% Code for gesture recognition for human sign language - a course project
%% for Artificial Neural Networks.

clear all
hand_bw = [];
for i = 1:5
    img_name = strcat(num2str(i), '.jpg');
    hand=imread(img_name); %reading new image
    %figure
    %imshow(hand);
    hand_bw = [hand_bw; im2bw(hand,0.41)];
end
imshow(hand_bw);
img_name = strcat('test.jpg');
hand=imread(img_name);
figure
test_bw = im2bw(hand, 0.41);
imshow(test_bw);
%% will take a video as an input and pass on frames, at certain interval
%  to main_test for analysing gestures through a series of posture recognition

readerobj = mmreader('vid.mp4');

vidFrames = read(readerobj);
num = 1;
[x y z numFrames] = size(vidFrames) %get(readerobj, 4)%
for k = 1 :45: numFrames             %4 set as number of skiping frames
    imwrite(vidFrames(:,:,:,k), strcat('gest',num2str(num),'.jpg'));
    num = num + 1;
end

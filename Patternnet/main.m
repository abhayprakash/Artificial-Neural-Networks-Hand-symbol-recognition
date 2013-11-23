%% Code for gesture recognition for human sign language - a course project
%% for Artificial Neural Networks. PATTERNNET
clear all;

% Contants
normX = 50;
normY = 50;
NUM_NET = 20;
x = []; t = [];
for s = 1:5
    for r = 1:5
        file_name = strcat(num2str(s) , ' (' , num2str(r) , ')' , '.jpg');
        y1 = crop(imread(file_name), normX, normY);
        %figure
        %imshow(y1)
        y11 = im2bw_skin(y1, normX, normY);
        y1 = y11;
        figure
        imshow(y1)

        %%
        temp1 = [];
        for i=1:normX
            for j = 1:normY
                temp1 = [temp1 y1(i,j)];
            end
        end

        y1 = 2*temp1' - 1;

        x = [x; y1'];
        t1 = zeros(1,5);
        t1(s) = 1;
        t = [t; t1];
    end
end
x = x';
t = t';
net = patternnet(NUM_NET);
net = train(net,x,t);
view(net)
y = net(x);
perf = perform(net,t,y);
classes = vec2ind(y)
disp('Training done');